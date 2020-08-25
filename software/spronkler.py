#!/usr/bin/env python3
import time
import datetime
import json
import threading
import zmq

# using the LED function to handle our pins.  It's a LED in an opto-isolator, after all : D
from gpiozero import LED


# Spronkler
class Spronkler():
    def __init__(self, pinmap):

        # set up ZMQ and start threads
        self.zmqctx = zmq.Context()
        
        # set up the daemons
        self.pinDaemon = self.PinDaemon(self.zmqctx, pinmap)
        self.scheduleDaemon = self.ScheduleDaemon(self.zmqctx)
        
        self.scheduleDaemon.pinDaemonZMQ = self.pinDaemon.zmq_address

        # wait for the threads to be ready
        pinDaemonAlive = False
        scheduleDaemonAlive = False
        while pinDaemonAlive == False or scheduleDaemonAlive == False:
            try:
                pinDaemonAlive = self.pinDaemon.ping()
                scheduleDaemonAlive = self.scheduleDaemon.ping()
            except zmq.error.Again:
                print("Daemons not yet alive....")
                continue

            time.sleep(0.25)

    # daemon-generic stuff
    class Daemon():
        class MsgPing():
            pass

        class MsgPong():
            pass

        class MsgNAK():
            def __init__(self, reason):
                self.reason = reason

        class MsgACK():
            def __init__(self, reason=""):
                self.reason = reason

        def ping(self):
            sock = self.zmqctx.socket(zmq.REQ)
            sock.setsockopt(zmq.RCVTIMEO, 250)
            sock.connect(self.zmq_address)

            msg = self.MsgPing()

            sock.send_pyobj(msg)
            msg = sock.recv_pyobj()

            if type(msg) == type(self.MsgPong()):
                self.log("Pinged succesfully.")
                retcode = True
            else:
                self.log("Non-ACK response received: {}.".format(type(msg)))
                retcode = False

            sock.close()
            return(retcode)
            
        def log(self, message):
            try:
                with open("logs/{}.log".format(self.threadname), "a") as logh:
                    message = "[{}]: {}\n".format(datetime.datetime.now(), message)
                    logh.write(message)
            except:
                print("FAILED TO LOG MESSAGE!  Too bad you won't see this when I'm a daemon :(")


    # Pin Controller Daemon
    class PinDaemon(Daemon):

        class MsgEnable():
            def __init__(self, pinmap):
                self.pinmap = pinmap

        class MsgDisable():
            pass

        class MsgSetChan():
            def __init__(self, channel, state):
                self.channel = channel
                self.state = state

        def __init__(self, ctx, pinmap):
            # ZMQ setup
            self.threadname = "pinDaemon"
            self.zmqctx = ctx
            self.zmq_address = "inproc://pinDaemon"
            self.__daemonThread = threading.Thread(name=self.threadname, target=self.__daemonThread)
            self.max_active_channels = 1

            #start the thread
            self.__daemonThread.start()

            #init
            self.init(pinmap)

        # Daemon thread
        def __daemonThread(self):
            # zmq connect
            sock = self.zmqctx.socket(zmq.REP)
            sock.bind(self.zmq_address)

            # track the number of active channels, and the time of last state change for each pin
            on_count = 0
            last_state_change = {}
            controller_state = ''

            while True:
                msg = sock.recv_pyobj()
                # switch on relevant message types
                # ping
                if isinstance(msg, self.MsgPing):
                    self.log("Received ping")
                    msg = self.MsgPong()

                # set channel
                elif isinstance(msg, self.MsgSetChan):
                    # bounce the request if we're not yet enabled
                    if controller_state != "ENABLED":
                        msg = self.MsgNAK("Controller not enabled.")

                    # set a channel
                    try:
                        if msg.state == True and on_count < self.max_active_channels:
                            CHANNELS[msg.channel].on()
                            self.log("Channel {} set to {}".format(msg.channel, msg.state))
                            on_count += 1
                            msg = self.MsgACK()
                        elif msg.state == True and on_count >= self.max_active_channels:
                            msg = self.MsgNAK("Too many channels already active!")
                        elif msg.state == False:
                            CHANNELS[msg.channel].off()
                            self.log("Channel {} set to {}".format(msg.channel, msg.state))
                            on_count -= 1
                            msg = self.MsgACK()
                    #except Exception as e:
                    except ValueError as e:
                        msg = self.MsgNAK("Exception occurred! {}".format(str(e)))

                # emable/set pinmap
                elif isinstance(msg, self.MsgEnable):
                    if controller_state == "ENABLED":
                        msg = self.MsgNAK("Controller already enabled.")
                    # update internals
                    PINMAP = msg.pinmap
                    CHANNELS = []
                    controller_state = "ENABLED"

                    for pin in PINMAP:
                        CHANNELS.append(LED(pin))
                        CHANNELS[-1].off()

                    self.log("Output enabled, with pinmap '{}'".format(', '.join( [ str(x) for x in msg.pinmap ] )))
                    msg = self.MsgACK()
                
                # disable all outputs
                elif isinstance(msg, self.MsgDisable):

                    # update internals
                    for chan in CHANNELS:
                        chan.off()

                    while len(CHANNELS) > 0:
                        del(CHANNELS[-1])
                    
                    self.log("All outputs set low and disabled!")
                    msg = self.MsgACK()

                # Fallthrough
                else:
                    msg = self.MsgNAK("Unknown Message")

                # reply
                sock.send_pyobj(msg)

        # enable the pin daemon and set the pin mappings
        def init(self, pinmap):
            sock = self.zmqctx.socket(zmq.REQ)
            sock.connect(self.zmq_address)

            msg = self.MsgEnable(pinmap)

            sock.send_pyobj(msg)
            data = sock.recv_pyobj()

            sock.close()
        
        # shuts off all outputs and destroys the controlling Led() objects
        def shutdown(self):
            sock = self.zmqctx.socket(zmq.REQ)
            sock.connect(self.zmq_address)

            msg = self.MsgDisable()

            sock.send_pyobj(msg)
            data = sock.recv_pyobj()

            sock.close()

        def channelSet(self, channel, state):
            sock = self.zmqctx.socket(zmq.REQ)
            sock.connect(self.zmq_address)

            msg = self.MsgSetChan(channel, state)

            sock.send_pyobj(msg)
            msg = sock.recv_pyobj()

            if isinstance(msg, self.MsgNAK):
                self.log("Channel set failed: '{}'".format(msg.reason))

            sock.close()
        
    # Pin Controller Daemon
    class ScheduleDaemon(Daemon):

        class MsgListSchedules():
            pass
        
        # the schedule object is presumed deserialized at this point
        class MsgAddSchedule():
            def __init__(self, schedule):
                self.schedule = schedule
             
        class MsgDeleteSchedule():
            def __init__(self, name):
                self.name = name

        class MsgClearSchedules():
            pass

        def __init__(self, ctx):
            # ZMQ setup
            self.threadname = "scheduleDaemon"
            self.zmqctx = ctx
            self.zmq_address = "inproc://scheduleDaemon"
            self.__daemonThread = threading.Thread(name=self.threadname, target=self.__daemonThread)
            self.max_active_channels = 1

            # some tunables and holders
            self.dateformat = '%m-%dT%H:%M:%S'
            self.schedules = []

            #start the thread
            self.__daemonThread.start()


        # validates whether or not a new schedule will conflict with *any* schedule currently enabled.
        def __conflictCheck(self, newschedule):
            # unroll the new schedule's start and end times
            newstart = datetime.datetime.strptime(newschedule["start_time"], self.dateformat)
            newend = datetime.datetime.strptime(newschedule["end_time"], self.dateformat)
            if newend < newstart:
                newend = newend + datetime.timedelta(days=365)
        
            # count up the total runtime for the new schedule
            newtotalruntime = 0
            for channel in newschedule['schedule'].keys():
                newtotalruntime += int(newschedule['schedule'][channel])
        
            # if the total runtime is longer than the interval, the schedule will conflict with itself
            if newtotalruntime >= newschedule['interval_minutes']:
                return self.MsgNAK("New schedule '{}' conflicts with itself! (Runtime is longer than interval)".format(newschedule['name']))
        
            # generate a list of runtimes for the new schedule
            newruntimes = []
            newruntimes.append((newstart, newstart + datetime.timedelta(minutes=newtotalruntime)))
            while newruntimes[-1][0] + datetime.timedelta(minutes=newschedule['interval_minutes']) < newstart + datetime.timedelta(days=365) and newruntimes[-1][1] + datetime.timedelta(minutes=newschedule['interval_minutes']) < newend:
                nextstart = newruntimes[-1][0] + datetime.timedelta(minutes=newschedule['interval_minutes'])
                nextend = nextstart + datetime.timedelta(minutes=newtotalruntime)
                newruntimes.append((nextstart, nextend))
        
            conflict_detected = False
            for schedule in self.schedules:
                # check if the run windows overlap.
                start = datetime.datetime.strptime(schedule["start_time"], self.dateformat)
                end = datetime.datetime.strptime(schedule["end_time"], self.dateformat)
                if end < start:
                    end = end + datetime.timedelta(days=365)
                    
                # if the run dates of the schedules overlap, continue checking for per-channel conflicts.  If not
                # we can assume there are no channel conflicts....obviously.
                if (newstart > start and newstart < end) or (newend > start or newend < end):
                    # get the total runtime for this schedule
                    totalruntime = 0
                    for channel in schedule['schedule'].keys():
                        totalruntime += int(schedule['schedule'][channel])
                        
                    # generate a list of start and end times for the new schedule
                    runtimes = []
                    runtimes.append((start, start + datetime.timedelta(minutes=totalruntime)))
                    while runtimes[-1][0] + datetime.timedelta(minutes=schedule['interval_minutes']) < start + datetime.timedelta(days=365) and runtimes[-1][1] + datetime.timedelta(minutes=schedule['interval_minutes']) < end:
                        nextstart = runtimes[-1][0] + datetime.timedelta(minutes=schedule['interval_minutes'])
                        nextend = nextstart + datetime.timedelta(minutes=totalruntime)
                        runtimes.append((nextstart, nextend))
                        
                    #check for running conflicts
                    i = 0
                    j = 0
                    while i < len(runtimes) and j < len(newruntimes):
                        i_start = runtimes[i][0]
                        i_end = runtimes[i][1]
                        j_newstart = newruntimes[j][0]
                        j_newend = newruntimes[j][1]
                        
                        # actually check
                        if (j_newstart >= i_start and j_newstart < i_end) or (j_newend > i_start and j_newend <= i_end):
                            #self.log("({0} >= {2} and {0} < {3}) or ({1} > {2} and {1} <= {3})".format(j_newstart, j_newend, i_start, i_end))
                            conflict_detected = True
                            conflicting_schedule = schedule
                            
                        # advance whichever schedule list is appropriate
                        if j_newstart > i_start:
                            i += 1
                        else:
                            j += 1
                            
                        if conflict_detected:
                            break
                            
                    if conflict_detected:
                        break
                            
            
            # the end, finally
            if conflict_detected:
                return self.MsgNAK("New schedule '{}' conflicts with existing schedule '{}'!".format(newschedule['name'], conflicting_schedule['name']))
            else:
                return self.MsgACK()
                        
                    
                 

        # Daemon thread
        def __daemonThread(self):
            # zmq connect
            sock = self.zmqctx.socket(zmq.REP)
            sock.RCVTIMEO = 500
            sock.bind(self.zmq_address)

            while True:
                try:
                    msg = sock.recv_pyobj()
                    # switch on relevant message types
                    # ping
                    if isinstance(msg, self.MsgPing):
                        self.log("Received ping")
                        msg = self.MsgPong()

                    # add a schedule
                    elif isinstance(msg, self.MsgAddSchedule):
                        conflict_result = self.__conflictCheck(msg.schedule)
                        if isinstance(conflict_result, self.MsgACK):
                            msg.schedule['running'] = False
                            self.schedules.append(msg.schedule)
                        msg = conflict_result
                           
                    # Remove a schedule
                    elif isinstance(msg, self.MsgDeleteSchedule):
                        i = 0
                        found = False
                        for schedule in self.schedules:
                            if schedule["name"] == msg.name:
                                found = True
                                del(self.schedules[i])
                                msg = self.MsgACK()
                            i += 1
                        if found == False:
                            msg = self.MsgNAK("No schedule with name '{}' found.".format(msg.name))
                                

                    # list active schedules
                    elif isinstance(msg, self.MsgListSchedules):
                        msg = self.MsgACK(reason=self.schedules)

                    # Fallthrough
                    else:
                        msg = self.MsgNAK("Unknown Message")

                    # reply
                    sock.send_pyobj(msg)
                except zmq.error.Again:
                    # iterate through live schedules, and if there is one due for triggering, pass its channel/time list
                    # to a thread which will execute it 
                    i = 0
                    while i < len(self.schedules):
                        start_time = datetime.datetime.strptime(self.schedules[i]['start_time'], self.dateformat)
                        end_time = datetime.datetime.strptime(self.schedules[i]['end_time'], self.dateformat)
                        now_raw = datetime.datetime.now()
                        #self.log("{} -> {}".format(now_raw.isoformat(), "{}-".format(now_raw.year) + self.dateformat + ".%f"))
                        now = datetime.datetime.strptime(now_raw.isoformat(), "{}-".format(now_raw.year) + self.dateformat + ".%f")
                        #self.log("Should I start Schedule '{}'?  It starts at {} and ends at {}.  Currently, it's {}.".format(self.schedules[i]['name'], start_time, end_time, now))
                        #self.log("Start > Now: {}, End < Now: {}, Already Running: {}".format(start_time >= now, end_time < now, self.schedules[i]['running'] == False))
                        if start_time <= now and end_time > now and self.schedules[i]['running'] == False:
                            self.__runSchedule(self.schedules[i]['schedule'])
                            self.schedules[i]['running'] = True
                            
                    
        def __scheduleRunnerThread(self, schedule):
            sock = self.zmqctx.socket(zmq.REQ)
            sock.connect(self.pinDaemonZMQ)

            for key in schedule.keys():
                channel = int(key)
                print("Channel {} running.".format(channel))
                
                # Set
                msg = Spronkler.PinDaemon.MsgSetChan(channel, True)
                sock.send_pyobj(msg)
                msg = sock.recv_pyobj()
                if isinstance(msg, Spronkler.PinDaemon.MsgNAK):
                    print("Whoopsie: {}".format(msg.reason))
                
                # Wait
                time.sleep(int(schedule[key]) * 1)
                
                # Unset
                msg = Spronkler.PinDaemon.MsgSetChan(channel, False)
                sock.send_pyobj(msg)
                msg = sock.recv_pyobj()
                if isinstance(msg, Spronkler.PinDaemon.MsgNAK):
                    print("Whoopsie: {}".format(msg.reason))
                
            sock.close()
        
            
                

        def __runSchedule(self, schedule):
            runthread = threading.Thread(name="scheduleRunner", target=self.__scheduleRunnerThread, args=(schedule,))
            runthread.start()

        def addSchedule(self, schedule):
            sock = self.zmqctx.socket(zmq.REQ)
            sock.connect(self.zmq_address)

            msg = self.MsgAddSchedule(schedule)

            sock.send_pyobj(msg)
            msg = sock.recv_pyobj()
            
            if isinstance(msg, self.MsgNAK):
                self.log("Failed to set schedule: {}".format(msg.reason))
            else:
                self.log("Added schedule successfully!")

            sock.close()
            
        def deleteSchedule(self, name):
            sock = self.zmqctx.socket(zmq.REQ)
            sock.connect(self.zmq_address)

            msg = self.MsgDeleteSchedule(name)

            sock.send_pyobj(msg)
            msg = sock.recv_pyobj()
            
            if isinstance(msg, self.MsgNAK):
                self.log("Failed to delete schedule '{}': {}".format(name, msg.reason))
            else:
                self.log("Deleted schedule '{}' successfully!".format(name))

            sock.close()

        def listSchedules(self):
            sock = self.zmqctx.socket(zmq.REQ)
            sock.connect(self.zmq_address)

            msg = self.MsgListSchedules()

            sock.send_pyobj(msg)
            msg = sock.recv_pyobj()
            
            if isinstance(msg, self.MsgNAK):
                self.log("Failed to list schedules!: {}".format(msg.reason))
            else:
                return(json.dumps(msg.reason, sort_keys=True, indent=4, separators=(',', ': ')))

            sock.close()
            
        def clearSchedules(self):
            sock = self.zmqctx.socket(zmq.REQ)
            sock.connect(self.zmq_address)

            msg = self.MsgClearSchedules()

            sock.send_pyobj(msg)
            msg = sock.recv_pyobj()
            
            if isinstance(msg, self.MsgNAK):
                self.log("Failed to clear schedules!")
            else:
                self.log("Schedules cleared!")
                
            sock.close()

            

#############

pinmap = [ 4, 17, 27, 22, 10, 9, 11, 5, 12, 6, 7, 8 ]

flerp = Spronkler(pinmap)
'''
flerp.pinDaemon.channelSet(2, True)
flerp.pinDaemon.channelSet(3, True)
flerp.pinDaemon.channelSet(2, False)
flerp.pinDaemon.channelSet(3, True)

with open("rainbird.json", "r") as fh:
    schedule = json.load(fh)
    
flerp.scheduleDaemon.addSchedule(schedule)
flerp.scheduleDaemon.addSchedule(schedule)

with open("rainbird2.json", "r") as fh:
    schedule = json.load(fh)
    
flerp.scheduleDaemon.addSchedule(schedule)
'''
with open("every_goddamn_minute.json", "r") as fh:
    schedule = json.load(fh)
    
flerp.scheduleDaemon.addSchedule(schedule)

print("Currently active schedules:")
print(flerp.scheduleDaemon.listSchedules())

#flerp.pinDaemon.shutdown()
