str1='on'
str2='off'

ADVANCE_STATUS=$(audtool playlist-auto-advance-status)
REPEAT_STATUS=$(audtool playlist-repeat-status)
CURRENT_SONG=$(audtool current-song)

# If the playlist skips to the next song after current song finishes AND the repeat button is toggled ON...
if [[ "$ADVANCE_STATUS" == "$str1" && "$REPEAT_STATUS" == "$str1" ]]; then 
	audtool playlist-auto-advance-toggle && echo "$CURRENT_SONG is on R E P E A T yo!"
elif [[ "$ADVANCE_STATUS" == "$str2" && "$REPEAT_STATUS" == "$str2" ]]; then
	audtool playlist-repeat-toggle && echo "$CURRENT_SONG is on R E P E A T yo!"
else 
	echo "We're R E P E A T I N G $CURRENT_SONG!"
fi

