#!/system/bin/sh

# Set defaults
command=$1

case $command in
    "enable")
        stop mi_thermald
        echo 1 > /sys/devices/system/cpu/cpu1/online
        echo 1 > /sys/devices/system/cpu/cpu2/online
        echo 1 > /sys/devices/system/cpu/cpu3/online
        echo 1 > /sys/devices/system/cpu/cpu4/online
        echo 1 > /sys/devices/system/cpu/cpu5/online
        echo 1 > /sys/devices/system/cpu/cpu6/online
        echo 1 > /sys/devices/system/cpu/cpu7/online
        echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
        echo performance > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
        echo performance > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
        echo performance > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
        echo performance > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
        echo performance > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
        echo performance > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
        echo "pass"
        ;;
    "disable")
        echo schedutil > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        echo schedutil > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
        echo schedutil > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
        echo schedutil > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
        echo schedutil > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
        echo schedutil > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
        echo schedutil > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
        echo schedutil > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
        start mi_thermald
        echo "pass"
        ;;
    *)
        echo "$command not support"
        echo "HQ_AutoTest --- $0 --- $command --- not support"
        ;;
esac