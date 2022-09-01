#!/system/bin/sh

# Set defaults
command_1=$1
command_name="IRTest"

val=`which IRTest`
if [[ $val == *$command_name* ]]; then
	IRTest $command_1
	echo "HQ_AutoTest --- $0 --- $command_name exist,input time is:$command_1 ms"
else
	echo "fail"
	echo "HQ_AutoTest --- $0 --- $command_name not exist!!!"
fi


