#!/system/bin/sh

BACKLIGHT_NOTE="/sys/class/leds/lcd-backlight/brightness"
#BACKLIGHT_NOTE="/sys/class/backlight/panel0-backlight/brightness"

usage(){
        echo "Usage: $0 unlock"
        exit 1
}

if [ $# -ne 1 ]; then
        usage
else
        if [ "$1" != "unlock" ]; then
                usage
                exit 1
        fi
fi

if [ -f $BACKLIGHT_NOTE ]; then
        value_bl=`cat $BACKLIGHT_NOTE`
else
        echo "$BACKLIGHT_NOTE not exist!!!"
        echo "fail"
        exit 1
fi

if [ 1 -eq $value_bl ]; then
        input keyevent 82 2>/dev/null
        if [ $? -eq 0 ]; then
                usleep 100
                input keyevent 82 2>/dev/null
                input keyevent 82 2>/dev/null
                if [ $? -eq 0 ]; then
                        echo "pass"
                        exit 0
                fi
        fi
else
        input keyevent 82 2>/dev/null
        #灭屏中间状态时，存在概率解锁失败问题，此处临时增加3次retry
        usleep 100
        input keyevent 82 2>/dev/null
        input keyevent 82 2>/dev/null
        input keyevent 82 2>/dev/null
        if [ $? -eq 0 ]; then
                echo "pass"
                exit 0
        fi
fi

echo "fail"
exit 1
