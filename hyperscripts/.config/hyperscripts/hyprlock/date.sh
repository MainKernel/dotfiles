date=$(date "+%d/%m/%y")
day=$(date "+%u")

case $day in
	1)
		day="Пон"
		;;
	2)
		day="Вів"
		;;
	3)
		day="Сер"
		;;
	4)
		day="Чет"
		;;
	5)
		day="Пят"
		;;
	6)
		day="Суб"
		;;
	7)
		day="Нед"
		;;
esac

echo "$day/$date"

