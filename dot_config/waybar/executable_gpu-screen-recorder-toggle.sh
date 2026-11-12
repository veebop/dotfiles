#!/bin/sh
if ! pkill --full '^gpu-screen-recorder($| )'; then
    (
        gpu-screen-recorder -w portal -c mp4 -k av1 -f 60 -a default_output -r 300 -o "$HOME/Videos/replays"
        pkill -RTMIN+1 waybar
    ) &
fi
pkill -RTMIN+1 waybar
