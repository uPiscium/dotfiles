#! /bin/bash 
temp="$(nvidia-smi -q -d temperature | awk 'NR==11{print $5}')"
gpu="$(nvidia-smi -q -d utilization | awk 'NR==11{print $3}')"
#echo -e " $temp°C"
echo -e "$gpu% [$temp°C]"
