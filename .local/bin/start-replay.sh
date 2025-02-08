#!/usr/bin/env bash

video_path="$HOME/Videos/Clips"
mkdir -p "$video_path"
notify-send -t 500 -u low -- "GPU Screen Recorder" "Started recording"
gpu-screen-recorder -w screen -f 60 -keyint 1.0 -a "default_output|default_input" -s 1920x1080 -c mp4 -bm cbr -cr full -q 26000 -k h264 -r 30 -o "$video_path"
