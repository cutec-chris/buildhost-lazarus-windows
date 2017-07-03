#!/bin/bash
/usr/bin/Xvfb :0 -screen 0 1024x768x24 > /dev/null &
/usr/bin/x11vnc &
/root/novnc/utils/launch.sh --vnc localhost:5900 --listen 8080 > /dev/null &
xterm &
#bash -c $1 $2 $3
wine $1 $2 $3 $4 $5 $6
killall xterm
killall x11vnc
killall Xvfb