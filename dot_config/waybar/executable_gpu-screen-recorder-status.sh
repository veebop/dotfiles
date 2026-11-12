#!/bin/sh
if pidof -q 'gpu-screen-recorder'; then
    text='ON'
    tooltip='Click to save recording, right-click to stop recording.'
    class='recording'
else
    text='OFF'
    tooltip='Right-click to start recording.'
    class=''
fi

printf '{"text": "%s", "tooltip": "%s", "class": "%s"}' "$text" "$tooltip" "$class" | jq --unbuffered --compact-output
