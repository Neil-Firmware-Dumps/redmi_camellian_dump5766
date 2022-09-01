#!/system/bin/sh

# Set defaults
command_1=$1
command_2=$2
command_3=$3

bin_name="sns_sensors_test_and_cal"
bin=`which $bin_name`
if [[ $bin != *$bin_name* ]]; then
	echo "sns_sensors_test_and_cal executable does not exist"
	echo "HQ_AutoTest --- $0 --- sns_sensors_test_and_cal executable does not exist"
	exit 1
fi

case $command_1 in
	"sensortest")
		case $command_2 in
			"Mag")
				sns_sensors_test_and_cal mag 1
				;;
			"Acc")
				sns_sensors_test_and_cal accel 1
				;;
			"Gyr")
				sns_sensors_test_and_cal gyro 1
				;;
			"Lux")
				sns_sensors_test_and_cal ambient_light 1
				;;
			"Prx")
				sns_sensors_test_and_cal proximity 1
				;;
			"Prx_state")
				sns_sensors_test_and_cal proximity_state 1
				;;
			"Bar")
				echo "$command_2 not support"
				;;
			"SAR")
				attribute_name="ro.boot.hwc"
				var=`getprop $attribute_name`
				if [ "Global" == $var ];then
					sns_sensors_test_and_cal sar 1
				else
					echo "$var not support SAR"
				fi
				;;
			"hall")
				echo "$command_2 not support"
				;;
			"slidehall")
				echo "$command_2 not support"
				;;
			*)
				echo "$command_2 not support"
				;;
		esac
		;;
	"sensorcalibration")
		case $command_2 in
			"Mag")
				sns_sensors_test_and_cal mag_cal 0
				;;
			"Acc")
				sns_sensors_test_and_cal accel_cal 2
				;;
			"Gyr")
				sns_sensors_test_and_cal gyro_cal 0
				;;
			"Lux")
				sns_sensors_test_and_cal ambient_light 2
				;;
			"Lux_data")
				sns_sensors_test_and_cal get_light_cal_coe 3
				;;
			"Lux_leak")
				sns_sensors_test_and_cal ambient_light_leak_cal 2
				;;
			"Lux_leak_data")
				sns_sensors_test_and_cal get_leak_light_bias 3
				;;
			"Prx")
				case $command_3 in
					"cover")
						sns_sensors_test_and_cal proximity_cal_3cm 2
						;;
					"nocover")
						sns_sensors_test_and_cal proximity_cal_0cm 2
						;;
					*)
						echo "$command_3 not support"
						echo "HQ_AutoTest --- $0 --- $command_3 not support"
						;;
				esac
				;;
			"Prx_data")
				sns_sensors_test_and_cal get_prox_cal_data 3
				;;
			"SAR")
				attribute_name="ro.boot.hwc"
				var=`getprop $attribute_name`
				if [ "Global" == $var ];then
					sns_sensors_test_and_cal sar_cal 2
				else
					echo "$var not support SAR"
				fi
				;;
			*)
				echo "$command_2 not support"
				echo "HQ_AutoTest --- $0 --- $command_2 not support"
				;;
		esac
		;;
	*)
		echo "$command_1 not support"
		echo "HQ_AutoTest --- $0 --- $command_1 not support"
		;;
esac
