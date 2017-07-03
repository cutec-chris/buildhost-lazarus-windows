#!/bin/bash
/usr/bin/Xvfb :0 -screen 0 1024x768x24 &
/usr/bin/x11vnc &
/root/novnc/utils/launch.sh --vnc localhost:5900 --listen 8080 &
xterm &
bash -c $1 $2 $3
#wine $1 $2 $3 $4 $5 $6
killall xterm
killall launch.sh
killall x11vnc
killall Xvfb