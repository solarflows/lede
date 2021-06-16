#!/bin/bash
RUNTIMES=0
s_dir=$(
  cd "$(dirname "$0")" || exit
  pwd
)
echo -e "\033[32m Strat $0 \033[0m"
if [ -f "$s_dir"/tmp/feeds.conf.default ]; then
  RUNTIMES=1
elif [[ ! -f $s_dir/tmp/feeds.conf.default ]] && [[ ! -f $s_dir/tmp/feeds.modify ]]; then
  mkdir -vp "$s_dir"/tmp
  cat feeds.conf.default >"$s_dir"/tmp/feeds.conf.default
  echo -e "\033[32m It's The First Time You Run This Script. \033[0m"
  sleep 1
  echo -e "\033[32m Start Initialization ! \033[0m"
  sleep 1
else
  echo -e "\033[31m Please Clean Up! \033[0m"
  exit 0
fi

if [ $RUNTIMES -eq 0 ]; then
  cat "$s_dir"/newfeeds >>feeds.conf.default
  if [ $? ]; then
    cat feeds.conf.default >"$s_dir"/tmp/feeds.modify
    echo -e "\033[32m Add Feeds To Feeds.conf.default Success \033[0m"
    echo -e "\033[32m Start Update.sh\033[0m"
    "$s_dir"/update.sh
  else
    echo -e "\033[31m Add Feeds To Feeds.conf.default Fail！\033[0m"
    exit 0
  fi
else
  echo -e "\033[31m Start $0 ！ \033[0m"
  echo -e "\033[31m Update root file！ \033[0m" && git pull
  "$s_dir"/update.sh
fi
exit 0
