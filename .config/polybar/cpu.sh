#!/bin/sh
temp="$(sensors | grep "Package id 0:" | tr -d '+' | awk '{printf "%2d", 0+$4}')"
cpu="$(vmstat 1 2 | tail -1 | awk '{printf "%2d", 100-$15}')"
echo -e "$cpu% [$temp°C]"
