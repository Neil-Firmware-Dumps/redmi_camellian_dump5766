#!/system/bin/sh

val1=`am start -n com.android.fmradio/.FmMainActivity`


if [[ $val1 == *"FmMainActivity"* ]]; then
	usleep 2000000
	val2=$(getprop sys.fmFactoryAutoTest)

	if [ $val2 == "1" ]; then
		echo "pass"
	else
		echo "fail"
		echo "HQ_AutoTest --- $0 --- $val2 --- fail"
	fi
else
	echo "fail"
	echo "HQ_AutoTest --- $0 --- $val1 --- fail"
	exit 1
fi

val3=`am force-stop com.android.fmradio`

