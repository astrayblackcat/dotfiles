#!/usr/bin/env bash

killall -SIGINT gpu-screen-recorder && notify-send -t 500 -u low -- "GPU Screen Recorder" "Stopped recording" 
