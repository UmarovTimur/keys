#!/bin/bash
yt-dlp -j --flat-playlist "URL_плейлиста" | jq -r '.url' > playlist.txt
