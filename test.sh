yt-dlp --cookies cookies.txt -o - "https://www.youtube.com/watch?v=_bmo-5RGXB4" | ffmpeg -re -i pipe:0 -c:v libx264 -preset veryfast -b:v 2500k -maxrate 2500k -bufsize 5000k -c:a aac -b:a 128k -f flv "rtmp://your.streaming.server/live2/26ex-m1pc-7tjq-detp-1f1x"
