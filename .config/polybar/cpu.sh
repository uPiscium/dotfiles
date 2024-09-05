#!/bin/sh
temp="$(sensors | grep "Package id 0:" | tr -d '+' | awk '{print 0+$4}')"
cpu="$(vmstat 1 2 | tail -1 | awk '{print 100-$15}')"
echo -e "$cpu% [$temp°C]"
