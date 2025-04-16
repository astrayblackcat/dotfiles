#!/usr/bin/env bash

timestamp=$(date +%Y-%m-%d_%H:%M:%S)
video_path="$HOME/Videos/Recordings/"
echo $timestamp
mkdir -p "$video_path"
notify-send -t 500 -u low -- "GPU Screen Recorder" "Started recording"
gpu-screen-recorder -w screen -f 60 -keyint 1.0 -a "default_output|default_input"\
                    -s 2560x1440 -c mp4 -bm cbr -cr full -q 26000 -k h264 -o "$video_path Recording $timestamp.mp4"
