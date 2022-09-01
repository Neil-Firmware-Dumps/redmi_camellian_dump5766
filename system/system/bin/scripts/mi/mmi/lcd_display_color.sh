#!/system/bin/sh

###This script need to send command to start APP to display different color screen.
###The comunication with APP need different color_id
usage(){
	echo "Usage: $0 <white|blue|green|black|gray|red|null>"
	exit 1
}

if [ $# -ne 1 ]; then
	usage
else
	color_mode=$1
fi

case $color_mode in
	"white") color_id=0
	;;
	"blue") color_id=1
	;;
	"green") color_id=2
	;;
	"black") color_id=3
	;;
	"gray") color_id=4
	;;
	"red") color_id=5
	;;
	"null")
		am force-stop com.huaqin.LCDTest >/dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "pass"
		else
			echo "fail"
			echo "HQ_AutoTest --- $0 --- fail"
		fi
		exit 0
	;;
	*) usage
	;;
esac

am start -n com.huaqin.LCDTest/.LCDTestActivity  --ei id $color_id >/dev/null 2>&1

if [ $? -eq 0 ]; then
	echo "pass"
else
	echo "fail"
	echo "HQ_AutoTest --- $0 --- fail"
fi
