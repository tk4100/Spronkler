# Spronkler
A sprinkler controller for raspberry pi, python controller software and KiCAD PCB design files.  Please please please don't edit
the "as-ordered" PCB files, for reasons that should be obvious.  They're useful for debugging boards of a particular revision.

# Software Architecture
Two main pieces, the webterface and the controller daemon.  The webUI is so far undesigned, but will communicate over ZMQ
to the controller daemon.

The controller daemon code is in Python, a master class with each major task in it's own thread/object, communicating with
inproc ZMQ. One of the aspects I wanted to explore was completely self-contained threads, each thread is responsible for
sanity in its own domain.  No matter what crazy commands are received via the ZMQ interface, a given thread should behave
safely.

## Controller
### Pin Daemon
Pretty simple here, controls actual GPIO outputs, and is responsible for preventing multiple channels from running at
once, as well as enforcing guard intervals etc.

### Schedule Daemon
Handles Schduling, with a total time-awareness of 365 days.  The plan is to have this daemon accept JSON objects
that represent a schedule, compare this new schedule with all other currently active schedules, reject the new
schedule if needed with a helpful message (ie, "conflicts with schedule 9, 'Rosemary dripline").  Similar logic
is required for activating/deactivating schedules.

Example schedule object.  It runs from May 1st, and repeats every 24 hours until October 1st.  The date is recorded in iso
format, but the year will be ignored. Looking at the schedule section, channel 1 runs for 5 minutes, channel 2 for 4 minutes,
and so on.
```json
{
   "name":"Demo Schedule",
   "start_time":"05-01T06:00:00",
   "end_time":"10-01T20:00:00",
   "interval_minutes":1440,
   "enabled":"true",
   "schedule":{
      "1":5,
      "2":4,
      "3":2,
      "4":4,
      "5":4,
      "6":5,
      "7":3,
      "9":5,
      "10":6,
      "12":6
   }
}
```

### API Daemon
The connection point to the webUI.  Probably will start out life as a simple bridge with one inproc ZMQ endpoint, and one
ipc or tcp endpoint.

# Hardware Architecture
A board powered by 24VAC which provides +5V on a standard Raspberry Pi header, as well as 3V3-safe inputs for a set of
opto-isolators.  ATM the power supply is linear, which doesn't work in practice, as it rapidly overheats from dropping
something like 29V.  The next rev will have a switching reg.

Pi Zero = ~125mA.  29 * 0.125 = ***3.625W**

## PSU
An LM317T and some caps.

***Note:*** There might be a noise problem here too.  I'm assuming the issue with Pi restarts is heat in the LM317, but
we might need some better noise suppression.  Don't forget to check before spinning a new board.

# I/O
An opto-isolated SSR across common and each sprinkler channel.  Only a TVS diode is protecting the AC side of these, which
may not be right.  A FET with a pullup controls the inputs here, which are in series with LED indication on the board.
