#!/system/bin/sh

BACKLIGHT_NOTE="/sys/class/backlight/panel0-backlight/brightness"
TP_TEST_NOTE="/proc/android_touch/self_test"

if [ -f $BACKLIGHT_NOTE ]; then
	value_bl=`cat $BACKLIGHT_NOTE`
else
	echo "HQ_AutoTest: $BACKLIGHT_NOTE not exist!!!"
	echo "fail"
	exit 1
fi

if [ 0 -eq $value_bl ]; then
	input keyevent 26 2>/dev/null
	if [ $? -eq 0 ]; then
		echo "HQ_AutoTest: input power key to wake up screen."
	fi
else
	input tap 360 1400 2>/dev/null
	if [ $? -eq 0 ]; then
		echo "HQ_AutoTest: touch screen to keep screen on."
	fi
fi

if [ -f $TP_TEST_NOTE ]; then
	value_ito=`cat $TP_TEST_NOTE`
	if [ "$value_ito" == "0P-1P-2P-3P-4P" ]; then
		echo "pass"
		exit 0
	else
		echo "fail"
		exit 1
	fi
else
	echo "HQ_AutoTest $TP_TEST_NOTE not exist!!!"
	echo "fail"
	exit 1
fi
