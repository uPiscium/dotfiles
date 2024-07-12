if [ $# -ne 1 ]; then
  echo "Usage: HDMI.sh left|right|off"
  exit 1;
fi

if [ $1 == "left" ]; then
  xrandr --output HDMI-1-0 --auto --left-of eDP-1 && notify-send "HDMI connected" || notify-send "HDMI disconnected"
else if [ $1 == "right" ]; then
  xrandr --output HDMI-1-0 --auto --right-of eDP-1 && notify-send "HDMI connected" || notify-send "HDMI disconnected"
else if [ $1 == "off" ]; then
  xrandr --output HDMI-1-0 --off && notify-send "HDMI disconnected" || notify-send "HDMI disconnecting failed"
else
  echo "Usage: HDMI.sh left|right|off"
  exit 1;
fi
fi
fi
