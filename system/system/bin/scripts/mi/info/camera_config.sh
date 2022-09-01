#!/system/bin/sh

# Set defaults
# J19C/S camera config
# [0]:rearMain,frontMain,rearDepth,rearMacro,rearUltra
# [1]:rearMain,frontMain,rearDepth,rearUltra
# [2]:rearMain,frontMain,rearDepth,rearMacro

node_name="/sys/class/huaqin/interface/hw_info/pcba_config"

if [ -f $node_name ];then
    val=`cat $node_name`
    project_1="J19S"
    project_2="J19C"
    project_3="J19L"
    project_4="J19N"
    countrycode_1="INDIA"
    countrycode_2="CN"
    countrycode_3="GLOBAL"
    countrycode_4="JAPAN"
    countrycode_5="THAILAND"

    if [[ $val == *$project_1* ]];then
        if [[ $val == *$countrycode_1* ]] || [[ $val == *$countrycode_3* ]] ||
           [[ $val == *$countrycode_4* ]] || [[ $val == *$countrycode_5* ]];then
            echo 0
            exit 0
        elif [[ $val == *$countrycode_2* ]];then
            echo 1
            exit 0
        else
            echo "$val not support"
            exit 1
        fi
    elif [[ $val == *$project_2* ]];then
        echo 2
        exit 0
    elif [[ $val == *$project_3* ]] || [[ $val == *$project_4* ]];then
        echo 0
        exit 0
    else
        echo "$val not support"
        exit 1
    fi

else
    echo "$node_name file no exist"
    exit 1
fi
