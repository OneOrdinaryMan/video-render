#!/usr/bin/bash
# Video Render
# Copyright (C) 2023  Srivathsan Sudarsanan
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
