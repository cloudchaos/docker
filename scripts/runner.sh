#! /bin/sh

export CONTAINER_STATE=$3
CONTAINER_NAMES=${*: 4:${#@}}

if [ "$CONTAINER_STATE" = 'pause' ]
then
    PAUSE_DURATION=$4
    CONTAINER_NAMES=${*: 5:${#@}}
elif [ "$CONTAINER_STATE" = 'stop' ]
then
    STOP_DURATION=$4
    CONTAINER_NAMES=${*: 5:${#@}}
elif [ "$CONTAINER_STATE" = 'delay' ]
then
    NETWORK_SIMULATION_DURATION=$4
    DELAY_DURATION_IN_MILLIS=$5
    CONTAINER_NAMES=${*: 6:${#@}}
fi

export PAUSE_DURATION
export CONTAINER_NAMES
export STOP_DURATION

export NETWORK_SIMULATION_DURATION
export DELAY_DURATION_IN_MILLIS

ansible-playbook -i host "$1"/"$2"/chaos_runner.yaml -vv