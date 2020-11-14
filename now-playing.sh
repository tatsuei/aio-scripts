#!/bin/bash

# Use 'watch' to track the songs every n seconds

np=$(rhythmbox-client --print-playing-format %tt)
old_np=$(tail -1 ./rhythmbox-np/now-playing.txt)

current_date=$(date +"%Y,%m,%d,%a")
current_album=$(rhythmbox-client --print-playing-format %at)
current_artist=$(rhythmbox-client --print-playing-format %tA)
current_song=$(rhythmbox-client --print-playing-format %tt)

if [[ "$old_np" == "$np" ]]; then
	echo "Now playing - $np"
else 
	echo $np >> ./rhythmbox-np/now-playing.txt && echo "Now playing - $np" && echo "$current_date, $current_album, $current_artist, $current_song" >> ./rhythmbox-np/nowplaying.csv
fi

