#!/system/bin/sh

BACKLIGHT_NOTE="/sys/class/backlight/panel0-backlight/brightness"
FLAHLIGHT_NOTE="/sys/class/leds/led:torch_0/brightness"
LEDLIGHT_NOTE="/sys/class/leds/red/brightness"

usage(){
	echo "Usage:$0  <backlight|flashlight|powerled>"
	exit 1
}

if [ $# -ne 1 ]; then
	usage
fi

command=$1

read_from_file()
{
	local file_name=$1
	if [ -f $file_name ]; then
		value=`cat $file_name`
		echo $value
		exit 0
	else
		echo "HQ_AutoTest --- $0 --- $file_name not exist!!!"
		echo "fail"
		exit 1
	fi
}

case $command in
	"backlight")
		read_from_file $BACKLIGHT_NOTE
		;;
	"flashlight0")
		read_from_file $FLAHLIGHT_NOTE
		;;
	"powerled")
		read_from_file $LEDLIGHT_NOTE
		;;
	*)
		echo "fail"
		echo "HQ_AutoTest --- $0 --- $command not support"
		exit 1
		;;
esac
