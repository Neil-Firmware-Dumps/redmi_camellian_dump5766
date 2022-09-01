#!/system/bin/sh

# Set defaults
command_1=$1
command_2=$2

case $command_1 in
	"wifi")
		case $command_2 in
			"status")
				svc wifi status
				;;
			"enable")
				svc wifi enable
				#ifconfig wlan0 up
				;;
			"scan")
				wpa_cli scan
				#iw dev wlan0 scan     
				;;
			"scan_details")
				wpa_cli scan_results
				;;
			"disable")
				svc wifi disable
				#ifconfig wlan0 down
				;;
			*)
				echo "HQ_AutoTest --- $command_2 not support"
				echo "$command_2 not support"
				;;
		esac
		;;
	"bluetooth")
		case $command_2 in
			"status")
				svc bluetooth status
				;;
			"enable")
				svc bluetooth enable
				;;
			"scan")
				svc bluetooth scan
				;;
			"scan_details")
				svc bluetooth scan_details
				;;
			"disable")
				svc bluetooth disable
				;;
			*)
				echo "HQ_AutoTest --- $command_2 not support"
				echo "$command_2 not support"
				;;
		esac
		;;
	*)
		echo "HQ_AutoTest --- $command_1 not support"
		echo "$command_1 not support"
		;;
esac
