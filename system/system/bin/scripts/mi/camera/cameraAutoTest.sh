#!/system/bin/sh


############################################################
#################### Help  descriptions ####################
#adb shell mifunctiontest cameratest cameraid size isfocus type [-a EV] [-x]
##cameraid:
#[front = 0]
#[mainback = 1]
#[subback = 2]
#[subfront = 3]
#[thirdback = 4]
#[forthback = 5]
##size :
#[max = 0]
#[middle = 1]
#[min = 2]
##isfocus:
#[focus = 0]
#[not focus = 1]
##type:
#[jpg = 0]
#[yuv = 1]
#[raw = 2]
##EV:(可选)
#1-12档位 1 亮度最低 12 亮度最高
##[-x]:(可选)
#文件名带分辨率信息
if [ "$1" = "--help" ]; then
   echo "camera ata usage: "$0" cameraid size isfocus "
   echo "cameraid:  [Front = 0]  [RearWide = 1]  [RearAux = 2]  [RearUltra = 3]  [RearMacro = 4]"
   echo "size :     [max = 0]    [middle = 1]    [min = 2]"
   echo "isfocus:   [focus = 0]  [not focus = 1]"
   echo "type:      [jpg = 0]    [yuv = 1]       [raw = 2]"
   echo "-a EV:     (可选)1-12档位 1 亮度最低 12 亮度最高"
   echo "-x:        (可选)文件名带分辨率信息"
   exit 0
fi
#################### Help  descriptions ####################
############################################################



############################################################
#################### analyze parameters ####################

if [[ "$#" = [1-2] ]]; then
   case $1 in
        "init")
                #clear the backgroung app including QcomCamera and CameraAutoTest
                pm clear com.huaqin.cameraautotest
                pm clear org.codeaurora.snapcam
                pm clear com.qualcomm.qti.qmmi
                settings put system screen_off_timeout 30000
                input keyevent 82 2>/dev/null
                input keyevent 82 2>/dev/null
                echo "pass"
                exit 0
                ;;
        "finish")
                echo "pass"
                exit 0
                ;;
        *)
                echo "fail"
                echo "$1 not support"
                exit 1
                ;;
    esac
fi

if [[ "$#" != [4-7] ]]; then
   echo "The number of input parameters is $#,it is not correct."
   exit 2;
fi
if [[ "$1" != [0-5] ]]; then
   echo "First Parameter is error. Please input correct First parameter[0-5]"
   exit 2;
fi
if [[ "$2" != [0-2] ]]; then
   echo "Second Parameter is error. Please input correct Second parameter[0-2]"
   exit 2;
fi
if [[ "$3" != [0-1] ]]; then
   echo "Third Parameter is error. Please input correct Third parameter[0-1]"
   exit 2;
fi
if [[ "$4" != [0-2] ]]; then
   echo "Forth Parameter is error. Please input correct Forth parameter[0-2]"
   exit 2;
fi
if [ $5 ]; then
   if [[ "$5" != "-a" && "$5" != "-x" ]]; then
      echo "Fifth Parameter is error. Please input correct Fifth parameter[-a,-x]"
      exit 2;
   fi
fi

#################### analyze parameters ####################
############################################################

############################################################
#################### Remove old picture ####################
Path1="/sdcard/*.jpg"
Path2="/sdcard/*.raw"
Path3="/sdcard/*.yuv"
#*.yuv,也是一种正则表达式,如果有多个符合条件的文件,值为多个字符串
removeInfo1="Remove old picture(jpg) successfully."
removeInfo2="Remove old picture(raw) successfully."
removeInfo3="Remove old picture(yuv) successfully."

files1=$(ls $Path1 2> /dev/null | wc -l)
if [ "$files1" != "0" ] ; then
   rm $Path1
   echo $removeInfo1
fi
files2=$(ls $Path2 2> /dev/null | wc -l)
if [ "$files2" != "0" ] ; then
   rm $Path2
   echo $removeInfo2
fi
files3=$(ls $Path3 2> /dev/null | wc -l)
if [ "$files3" != "0" ] ; then
   rm $Path3
   echo $removeInfo3
fi
#################### Remove old picture ####################
############################################################


############################################################
#################### Start CameraActivity ##################
#adb shell am start -n com.huaqin.cameraautotest\/.CameraAutoTest
#--ei "cameraid" 0
#--ei "size" 0
#--ei "autofocus" 0
#--ei "type" 0
#--ei "EV" 0
#--ei "needSolution" 1

cameraid=$1

#case $cameraid in
#    "0")
#    camera_front=`getprop persist.vendor.camera.front`
#    if [  "$camera_front" = "" ];then
#        echo "front camera not exist!!!"
#        echo "fail"
#        exit 1
#    fi
#    ;;
#    "1")
#    camera_main=`getprop persist.vendor.camera.main`
#    if [ "$camera_main" = "" ];then
#        echo "main camera not exist!!!"
#        echo "fail"
#        exit 1
#    fi
#    ;;
#    "2")
#    camera_depth=`getprop persist.vendor.camera.depth`
#    if [ "$camera_depth" = "" ];then
#        echo "depth camera not exist!!!"
#        echo "fail"
#        exit 1
#    fi
#    ;;
#    "3")
#    camera_ultra=`getprop persist.vendor.camera.ultra`
#    if [ "$camera_ultra" = "" ];then
#        echo "ultra camera not exist!!!"
#        echo "fail"
#        exit 1
#    fi
#    ;;
#    "4")
#    camera_macro=`getprop persist.vendor.camera.macro`
#    if [ "$camera_macro" = "" ];then
#        echo "macro camera not exist!!!"
#        echo "fail"
#        exit 1
#    fi
#    ;;
#esac

#convert $3 to focus
if [ "$3" = "0" ]; then
   #focus
   focus=0
elif [ "$3" = "1" ]; then
   #not focus
   focus=1
fi
#convert -x to needSolution
if [[ "$#" = "4" ]]; then
   am start -n com.huaqin.cameraautotest\/.CameraAutoTest --ei "cameraid" $cameraid --ei "size" $2 --ei "autofocus" $focus --ei "type" $4
fi

if [[ "$#" = "5" ]]; then
   am start -n com.huaqin.cameraautotest\/.CameraAutoTest --ei "cameraid" $cameraid --ei "size" $2 --ei "autofocus" $focus --ei "type" $4 --ei "needSolution" 1
fi

if [[ "$#" = "6" ]]; then
   am start -n com.huaqin.cameraautotest\/.CameraAutoTest --ei "cameraid" $cameraid --ei "size" $2 --ei "autofocus" $focus --ei "type" $4 --ei "EV" $6
fi

if [[ "$#" = "7" ]]; then
   am start -n com.huaqin.cameraautotest\/.CameraAutoTest --ei "cameraid" $cameraid --ei "size" $2 --ei "autofocus" $focus --ei "type" $4 --ei "EV" $6 --ei "needSolution" 1
fi
#################### Start CameraActivity ##################
############################################################



############################################################
#################### return result #########################
#exit script after generate picture
num=0
takesuccess=0
while [[ $num -lt 12 ]]
do

echo "num ="$num
picture1=$(ls $Path1 2> /dev/null | wc -l)
picture2=$(ls $Path2 2> /dev/null | wc -l)
picture3=$(ls $Path3 2> /dev/null | wc -l)
if [ "$picture1" != "0" ] ; then
   echo "Take Picture(jpg) successfully"
   exit 3
elif [ "$picture2" != "0" ] ; then
   echo "Take Picture(raw) successfully"
   exit 3
elif [ "$picture3" != "0" ] ; then
   echo "Take Picture(yuv) successfully"
   exit 3
fi

if [ $num == "6" ] && [ "$picture1" == "0" ] && [ "$picture2" == "0" ] && [ "$picture3" == "0" ] ; then
   pm clear com.huaqin.cameraautotest
   usleep 200

   if [[ "$#" = "4" ]]; then
      am start -n com.huaqin.cameraautotest\/.CameraAutoTest --ei "cameraid" $cameraid --ei "size" $2 --ei "autofocus" $focus --ei "type" $4
   fi

   if [[ "$#" = "5" ]]; then
      am start -n com.huaqin.cameraautotest\/.CameraAutoTest --ei "cameraid" $cameraid --ei "size" $2 --ei "autofocus" $focus --ei "type" $4 --ei "needSolution" 1
   fi

   if [[ "$#" = "6" ]]; then
      am start -n com.huaqin.cameraautotest\/.CameraAutoTest --ei "cameraid" $cameraid --ei "size" $2 --ei "autofocus" $focus --ei "type" $4 --ei "EV" $6
   fi

   if [[ "$#" = "7" ]]; then
      am start -n com.huaqin.cameraautotest\/.CameraAutoTest --ei "cameraid" $cameraid --ei "size" $2 --ei "autofocus" $focus --ei "type" $4 --ei "EV" $6 --ei "needSolution" 1
   fi

   echo "Take Picture timeout and retry."
fi

let "num++"
sleep 1
done

echo "Take Picture fail"
exit 4
#################### return result #########################
############################################################
