#!/bin/bash

# URL вашего YouTube плейлиста
PLAYLIST_URL="https://www.youtube.com/playlist?list=PLgnSUXTkFZ22TW4h2g_3QBnjKJVsHr_Yd"

# RTMP-сервер (замените на ваш адрес)
STREAM_URL="rtmp://your.streaming.server/live2/26ex-m1pc-7tjq-detp-1f1x"

# Получаем список видео из плейлиста и начинаем трансляцию
while true; do
    # Получаем список видео из плейлиста и передаем его в цикл
    yt-dlp -j --flat-playlist "$PLAYLIST_URL" | jq -r '.url' | while read -r VIDEO_URL; do
        echo "Streaming: $VIDEO_URL"
        # Запускаем видео через ffmpeg, отправляя его на RTMP сервер
        yt-dlp -o - "$VIDEO_URL" | ffmpeg -re -i pipe:0 -c:v libx264 -preset veryfast -b:v 2500k -maxrate 2500k -bufsize 5000k \
            -c:a aac -b:a 128k -f flv "$STREAM_URL"
    done
done

