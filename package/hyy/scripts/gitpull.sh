#!/bin/bash
echo -e "\033[32m Strat $0 \033[0m"
function showMsg() {
    echo -e "\033[32m$1\033[0m"
}

function getdir() {
    for element in $(ls $1); do
        dir_or_file=$1"/"$element
        if [ -d $dir_or_file ]; then
            cd $1"/"$element
            showMsg 'git pull '$element
            git pull
        else
            echo $dir_or_file
        fi
    done
}

getdir $1
