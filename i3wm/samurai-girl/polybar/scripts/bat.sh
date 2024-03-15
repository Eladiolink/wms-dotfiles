#!/bin/bash

LEVEL=$(cat /sys/class/power_supply/BAT1/capacity)
STATUS=$(cat /sys/class/power_supply/BAT1/status)

if [[ $LEVEL -lt 20 ]] ; then
        if [[ "$STATUS" == "Discharging" ]]; then
          notify-send --urgency=critical --icon=battery-caution "Bateria baixa ${LEVEL}%" "Descarregando"
        fi
fi

if [[ $LEVEL = 100 ]] ; then
        if [[ "$STATUS" == "Discharging" ]]; then
          notify-send --urgency=low --icon=battery-caution "Bateria baixa ${LEVEL}%" "Descarregando"
        fi
fi
