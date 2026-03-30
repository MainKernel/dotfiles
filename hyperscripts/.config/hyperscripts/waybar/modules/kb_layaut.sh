KB_LAYAUT=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')

case $KB_LAYAUT in
	*"English"*)
		KB_LAYAUT="US"
		;;
	*"Ukrainian"*)
		KB_LAYAUT="UA"
		;;
esac

echo "{\"text\":\"$KB_LAYAUT\"}"
