# Spronkler

A sprinkler controller for raspberry pi.

# Architecture

Two main pieces, the webterface and the controller daemon.  The webUI is so far undesigned, but will communicate over ZMQ
to the controller daemon.

The controller daemon code is in Python, a master class with each major task in it's own thread/object, communicating with
inproc ZMQ. One of the aspects I wanted to explore was completely self-contained threads, each thread is responsible for
sanity in its own domain.  No matter what crazy commands are received via the ZMQ interface, a given thread should behave
safely.

## Pin Daemon

Pretty simple here, controls actual GPIO outputs, and is responsible for preventing multiple channels from running at
once, as well as enforcing guard intervals etc.

## Schedule Daemon

Handles Schduling, with a total time-awareness of 365 days.  The plan is to have this daemon accept JSON objects
that represent a schedule, compare this new schedule with all other currently active schedules, reject the new
schedule if needed with a helpful message (ie, "conflicts with schedule 9, 'Rosemary dripline").  Similar logic
is required for activating/deactivating schedules.

Example schedule object.  It runs from May 1st 2020, and repeats every 24 hours until October 1st. Looking at
the schedule section, channel 1 runs for 5 minutes, channel 2 for 4 minutes, and so on.
```json
{
   "name":"Demo Schedule",
   "start_time":"2020-05-01T06:00:00",
   "end_time:"2020-10-01T20:00:00",
   "interval_minutes":1440,
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

