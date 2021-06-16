#!/bin/bash
s_dir=$(
  cd "$(dirname "$0")"
  pwd
)
root_dir=$(pwd)
M_conf=$(pwd)/.config
M_seed=$(pwd)/bin/targets/x86/64/config.seed
start=$(date +%s) # %s可以计算的是1970年以来的秒数
echo -e "\033[32m Strat $0 ! \033[0m"
if [[ -f $M_conf ]] && [[ -f $M_seed ]]; then
  if [ "$M_conf" -ot "$M_seed" ]; then
    echo -e "\033[32m Config File Exist ,But Out of Day ! \033[0m"
    echo -e "\033[32m Update Config !\033[0m"
    cat $M_seed >$M_conf
    make defconfig
  else
    echo -e "\033[32m You Have Update Config By Yourself ! \033[0m"
    echo -e "\033[32m Compile Wirh New Config ! \033[0m"
  fi
elif [[ -f $M_conf ]] && [[ ! -f $M_seed ]]; then
  echo -e "\033[32m Config File Exist ! \033[0m"
  echo -e "\033[32m Start First Compile ! \033[0m"
elif [[ ! -f $M_conf ]] && [[ -f $M_seed ]]; then
  cat $M_seed >$M_conf
  echo -e "\033[32m Copy Exist Config \033[0m"
  make defconfig
elif [[ ! -f $M_conf ]] && [[ ! -f $M_seed ]]; then
  echo -e "\033[32m Start Defconfig \033[0m"
  make defconfig
fi
echo -e "\033[32m Download Files \033[0m"
make download -j8
echo -e "\033[32m Start Compile Firmware \033[0m"
sleep 2
make -j$(($(nproc) + 1)) || make -j1 V=s || echo -e "\033[31m Compile Fail !\033[0m"
# if [ !$? ]; then
#   make -j1 V=s
# else
#   echo -e "\033[31m Compile Fail !\033[0m"
# fi
end=$(date +%s)
time=$(echo $start $end | awk '{print $2-$1}')
echo -e "\033[32m $0 done ! Work Time $time \033[0m"
