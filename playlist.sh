#!/bin/bash
yt-dlp -j --flat-playlist "PLgnSUXTkFZ22TW4h2g_3QBnjKJVsHr_Yd" | jq -r '.url' > playlist.txt
