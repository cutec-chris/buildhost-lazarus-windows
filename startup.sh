#!/bin/bash
/usr/bin/Xvfb :0 -screen 0 1024x768x24 > /dev/null &
sleep 1
/usr/bin/x11vnc &
sleep 1
/root/novnc/utils/launch.sh --vnc localhost:5900 --listen 8080 > /dev/null &
sleep 1
xterm &
#bash -c $1 $2 $3
wine $1 $2 $3 $4 $5 $6
killall xterm
killall x11vnc
killall Xvfb