#!/usr/bin/bash

if [ $# -ne 4 ]; then
    echo "video_render <file_name> <show_name> <episode_no> <episode_title>"
    exit 1
fi

bitrate=2259k
resolution=1920x1080

ffmpeg -i "$1" \
    -map 0 -c:a copy -c:v libx265 -c:s copy -c:s:t copy \
    -b:v $bitrate -s $resolution \
    -metadata title="$4" \
    "$2 - $3 - $4.mkv";

dunstify "Video Render complete!"
