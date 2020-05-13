str1='on'
str2='off'

ADVANCE_STATUS=$(audtool playlist-auto-advance-status)
REPEAT_STATUS=$(audtool playlist-repeat-status)
CURRENT_PLAYLIST=$(audtool current-playlist-name)

# If auto-advance is off and repeat button is toggled then...
if [[ "$ADVANCE_STATUS" == "$str2" && "$REPEAT_STATUS" == "$str1" ]]; then 
	audtool playlist-auto-advance-toggle && echo "$CURRENT_PLAYLIST is on R E P E A T!"
# Else if auto-advance is on and repeat button is not toggled then...
elif [[ "$ADVANCE_STATUS" == "$str1" && "$REPEAT_STATUS" == "$str2" ]]; then
	audtool playlist-repeat-toggle && echo "$CURRENT_SONG is on R E P E A T!"
# Else if auto-advance is off and repeat button is not toggled then...
elif [[ "$ADVANCE_STATUS" == "$str2" && "$REPEAT_STATUS" == "$str2" ]]; then
	audtool playlist-auto-advance-toggle && audtool playlist-repeat-toggle && echo "$CURRENT_SONG is on R E P E A T!"
else 
	echo "We're R E P E A T I N G $CURRENT_PLAYLIST"
fi
