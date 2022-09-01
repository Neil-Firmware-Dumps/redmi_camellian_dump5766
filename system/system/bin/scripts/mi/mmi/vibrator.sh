#!/system/bin/sh

# Set defaults
time=$1

time_node_name="/sys/class/leds/vibrator/duration"
node_name="/sys/class/leds/vibrator/activate"

if [ -f $node_name -a -f $time_node_name ];then
	echo $time > $time_node_name
	if [ $? -eq 0 ];then
		echo 1 > $node_name
		if [ $? -eq 0 ];then
			echo "pass"
		else
			echo "fail"
			echo "HQ_AutoTest --- $0 --- 1 --- fail"
			exit 1
		fi
	else
		echo "fail"
		echo "HQ_AutoTest --- $0 --- 2 --- fail"
		exit 1
	fi
else
	echo "fail"
    	echo "HQ_AutoTest --- $0 --- 3 --- fail"
	exit 1
fi
