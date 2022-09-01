#!/system/bin/sh

DIR_LOG="/sdcard/hq_auto_test_logs/"

if [ ! -d $DIR_LOG ];then
    mkdir $DIR_LOG
fi

FILE_NAME="hq_auto_test_logs_`date +%F`.log"
DIR_LOG="${DIR_LOG}${FILE_NAME}"

# function logging
function loginfo(){
    #echo "$1"
    echo "$(date +"%Y-%m-%d %H:%M:%S") --- $1"  >> ${DIR_LOG} 2>> ${DIR_LOG}
}
