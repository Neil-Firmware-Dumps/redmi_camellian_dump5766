#!/system/bin/sh

BACKLIGHT_NOTE="/sys/class/leds/lcd-backlight/brightness"
#BACKLIGHT_NOTE="/sys/class/backlight/backlight/brightness"
#BACKLIGHT_NOTE="/sys/class/backlight/panel0-backlight/brightness"
#FLAHLIGHT_NOTE="/sys/class/leds/flashlight/brightness"
FLAHLIGHT_NOTE="/sys/class/leds/led:torch_0/brightness"
FLASHLIGHT_SWITCH_NOTE="/sys/class/leds/led:switch_0/brightness"
FLASHLIGHT_OPEN_VALUE="1"
FLASHLIGHT_CLOSE_VALUE="0"
LEDLIGHT_NOTE="/sys/class/leds/red/brightness"
OUTPUT_PASS=1
NOT_OUTPUT_PASS=0


usage(){
	echo "Usage:$0  <backlight|flashlight|powerled> <0~255>"
	exit 1
}

if [ $# -ne 2 ]; then
	usage
fi

command=$1
brightness_value=$2

write_to_file()
{
	local file_name=$1
	local value=$2
	local o_pass=$3
	if [ -f $file_name ]; then
		echo $value > $file_name
		val=`echo $?`
		if [ 0 -eq $val ]; then
			if [ $OUTPUT_PASS -eq $o_pass ]; then
				echo "pass"
			fi
		else
			echo "fail"
		fi
	else
		echo "fail  $file_name not exist!!!"
		echo "HQ_AutoTest --- $0 --- $file_name not exist!!!"
		exit 1
	fi
}

case $command in
	"backlight")
		write_to_file $BACKLIGHT_NOTE $brightness_value $OUTPUT_PASS
		;;
	"flashlight0")
        write_to_file $FLASHLIGHT_SWITCH_NOTE $FLASHLIGHT_CLOSE_VALUE $NOT_OUTPUT_PASS
		write_to_file $FLAHLIGHT_NOTE $brightness_value $OUTPUT_PASS
		if [ $brightness_value -gt 0 ]; then
			write_to_file $FLASHLIGHT_SWITCH_NOTE $FLASHLIGHT_OPEN_VALUE $NOT_OUTPUT_PASS
		fi
		;;
	"powerled")
		write_to_file $LEDLIGHT_NOTE $brightness_value $OUTPUT_PASS
		;;
	*)
		echo "fail  command not exist!!!"
		echo "HQ_AutoTest --- $0 --- fail  command not exist!!!"
		exit 1
		;;
esac
