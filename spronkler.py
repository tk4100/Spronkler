#!/usr/bin/env python3

import time
import threading
import zmq

# using the LED function to handle our pins.  It's a LED in an opto-isolator, after all : D
from gpiozero import LED


# Spronkler
class Spronkler():
    def __init__(self, pinmap):

        # set up ZMQ and start threads
        self.zmqctx = zmq.Context()
        
        # set up the pin daemon
        self.pinDaemon = self.PinDaemon(self.zmqctx, pinmap)
        

        # wait for the threads to be ready
        pinDaemonAlive = False
        while pinDaemonAlive == False:
            try:
                pinDaemonAlive = self.pinDaemon.ping()
            except zmq.error.Again:
                print("Pin Daemon not yet alive....")
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
            pass

        def ping(self):
            sock = self.zmqctx.socket(zmq.REQ)
            sock.setsockopt(zmq.RCVTIMEO, 250)
            sock.connect(self.zmq_address)

            msg = self.MsgPing()

            sock.send_pyobj(msg)
            msg = sock.recv_pyobj()

            if type(msg) == type(self.MsgPong()):
                print("Pinged thread {} succesfully.".format(self.threadname))
                retcode = True
            else:
                print("Non-ACK response received: {}.".format(type(msg)))
                retcode = False

            sock.close()
            return(retcode)


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
                    print("pinDaemon: Received ping")
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
                            print("pinDaemon: Channel {} set to {}".format(msg.channel, msg.state))
                            on_count += 1
                            msg = self.MsgACK()
                        elif msg.state == True and on_count >= self.max_active_channels:
                            msg = self.MsgNAK("Too many channels already active!")
                        elif msg.state == False:
                            CHANNELS[msg.channel].off()
                            print("pinDaemon: Channel {} set to {}".format(msg.channel, msg.state))
                            on_count -= 1
                            msg = self.MsgACK()
                    except Exception as e:
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

                    
                    print("Output enabled, with pinmap '{}'".format(', '.join( [ str(x) for x in msg.pinmap ] )))
                    msg = self.MsgACK()
                
                # disable all outputs
                elif isinstance(msg, self.MsgDisable):

                    # update internals
                    for chan in CHANNELS:
                        chan.off()

                    while len(CHANNELS) > 0:
                        del(CHANNELS[-1])
                    
                    print("All outputs set low and disabled!")
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
                print("Channel set failed: '{}'".format(msg.reason))

            sock.close()
        
    # Pin Controller Daemon
    class ScheduleDaemon(Daemon):

        class MsgEnable():
            def __init__(self, pinmap):
                self.pinmap = pinmap

        class MsgDisable():
            pass

        def __init__(self, ctx, pinmap):
            # ZMQ setup
            self.threadname = "scheduleDaemon"
            self.zmqctx = ctx
            self.zmq_address = "inproc://scheduleDaemon"
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

            while True:
                msg = sock.recv_pyobj()
                # switch on relevant message types
                # ping
                if isinstance(msg, self.MsgPing):
                    print("pinDaemon: Received ping")
                    msg = self.MsgPong()


                ########### DO SHIT

                # Fallthrough
                else:
                    msg = self.MsgNAK("Unknown Message")

                # reply
                sock.send_pyobj(msg)

#############

pinmap = [ 4, 17, 27, 22, 10, 9, 11, 5, 12, 6, 7, 8 ]

flerp = Spronkler(pinmap)
flerp.pinDaemon.channelSet(2, True)
flerp.pinDaemon.channelSet(3, True)
flerp.pinDaemon.channelSet(2, False)
flerp.pinDaemon.channelSet(3, True)
flerp.pinDaemon.shutdown()
