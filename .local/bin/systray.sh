#!/bin/bash



hidden=/tmp/syshide.lock

file="/home/duel/.config/polybar/user_modules.ini"



if [[ $(pidof stalonetray) ]]; then

	if [[ ! -e $hidden ]]; then

		polybar-msg action "#systemtray.hook.1"

		xdo hide -n stalonetray

		touch "$hidden"

		perl -0 -i -pe 's/systray\ninitial=.*/systray\ninitial=2/g' "$file"

	else

		polybar-msg action "#systemtray.hook.0"

		xdo show -n stalonetray 

		xdo raise -n stalonetray

		rm "$hidden"

		perl -0 -i -pe 's/systray\ninitial=.*/systray\ninitial=1/g' "$file"

	fi

else

	stalonetray &

fi
