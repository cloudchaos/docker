#! /bin/sh

export CONTAINER_STATE=$3

if [ "$CONTAINER_STATE" = 'kill' ]
then
    CONTAINER_NAMES=${*: 4:${#@}}
elif [ "$CONTAINER_STATE" = 'pause' ]
then
    PAUSE_DURATION=$4
    CONTAINER_NAMES=${*: 5:${#@}}
elif [ "$CONTAINER_STATE" = 'stop' ]
then
    STOP_DURATION=$4
fi

export PAUSE_DURATION
export CONTAINER_NAMES
export STOP_DURATION

export NETWORK_SIMULATION_DURATION=$4
export DELAY_DURATION_IN_MILLIS=$5

ansible-playbook -i host "$1"/"$2"/chaos_runner.yaml -vv