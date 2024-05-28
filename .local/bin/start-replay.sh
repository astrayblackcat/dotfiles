#!/usr/bin/env bash

video_path="$HOME/Videos/Clips"
mkdir -p "$video_path"
notify-send -t 500 -u low -- "GPU Screen Recorder" "Started recording"
gpu-screen-recorder -w $(xrandr | grep -o "DP-[0-9]") -f 60 -a "sound/$(pactl get-default-sink).monitor" -a "mic/$(pactl get-default-source)" -c mp4 -k h264 -r 30 -o "$video_path"
