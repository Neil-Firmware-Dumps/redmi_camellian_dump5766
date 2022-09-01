#!/system/bin/sh

BACKLIGHT_NOTE="/sys/class/backlight/panel0-backlight/brightness"

if [ -f $BACKLIGHT_NOTE ]; then
        value_bl=`cat $BACKLIGHT_NOTE`
else
        echo "$BACKLIGHT_NOTE not exist!!!"
        echo "fail"
        exit 1
fi

if [ 1 -ne $value_bl ]; then
        input keyevent 26 2>/dev/null
        if [ $? -eq 0 ]; then
            echo "pass"
            exit 0
        else
            echo "fail"
            exit 1
        fi
else
        echo "pass"
        exit 0
fi