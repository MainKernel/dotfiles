KB_LAYAUT=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')

case $KB_LAYAUT in
	*"English"*)
		echo "US"
		;;
	*"Ukrainian"*)
		echo "UA"
		;;
esac
