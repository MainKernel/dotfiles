title=$(playerctl metadata --format '{{title}}' 2>/dev/null || echo "...")
status=$(playerctl status 2>/dev/null || echo "Stopped")
if [[ $status == "Playing" ]]; then
	title=" $title"
else
	title=" $title"
fi

if [[ $title == "..." ]]; then
	echo "$title"
else
	echo "${title:0:20}..."
fi

