#!/bin/bash

function main() {
# Pipewire
  local SOURCE=$(pactl list cards | sed -n 's/^*.*"\(.*\)" prio=.*$/\1/p')
  local SINK=$(pactl list cards | sed -n 's/^*.*"\(.*\)" prio=.*$/\1/p')
  local VOLUME=$(pactl list sinks | sed -n "/${SINK}/,/Volume/ s!^[[:space:]]\+Volume:.* \([[:digit:]]\+\)%.*!\1!p")
  local IS_MUTED=$(pactl list sinks | sed -n "/${SINK}/,/Mute/ s/Mute: \(yes\)/\1/p")

  local action=$1
  if [ "${action}" == "up" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +10%
  elif [ "${action}" == "down" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -10%
  elif [ "${action}" == "mute" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
  else
    if [ "${IS_MUTED}" != "" ]; then
      echo " ${SOURCE} |  MUTED ${SINK}"
    else
      echo " ${SOURCE} |  ${VOLUME}% ${SINK}"
    fi
  fi
}

main $@
