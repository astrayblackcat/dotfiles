#!/usr/bin/env bash

video_path="$HOME/Videos/Clips"
mkdir -p "$video_path"
notify-send -t 500 -u low -- "GPU Screen Recorder" "Started recording"
gpu-screen-recorder -w $(xrandr | grep -o "DP-[0-9]") -f 60 -keyint 1.0 -a "sound/default_output|mic/default_input" -c mp4 -q medium -k h264 -r 30 -o "$video_path"
