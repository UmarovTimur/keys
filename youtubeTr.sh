#!/bin/bash

PLAYLIST="playlist.txt"
STREAM_URL="rtmp://a.rtmp.youtube.com/live2/26ex-m1pc-7tjq-detp-1f1x" # Замените на URL вашего RTMP-сервера

while true; do
    while read -r VIDEO_URL; do
        echo "Streaming: $VIDEO_URL"
        yt-dlp -o - "$VIDEO_URL" | ffmpeg -re -i pipe:0 -c:v libx264 -preset veryfast -b:v 2500k -maxrate 2500k -bufsize 5000k \
            -c:a aac -b:a 128k -f flv "$STREAM_URL"
    done < "$PLAYLIST"
done
