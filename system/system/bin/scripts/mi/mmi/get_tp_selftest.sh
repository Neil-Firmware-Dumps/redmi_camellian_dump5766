#!/system/bin/sh
##test data file location is set by TP BSP owner

ls -l /sdcard/testdata.csv 2>/dev/null >/dev/null
if [ $? -eq 0 ]; then
       ls -l /sdcard/testdata.csv | awk '{print $8}'
else
	echo "fail"
	echo "HQ_AutoTest --- $0 --- fail"
fi
