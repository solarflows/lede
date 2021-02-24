#!/bin/bash
s_dir=$(cd "$(dirname "$0")";pwd)
root_dir=`pwd`
work_dir=$root_dir/package/mydiy
$root_dir/scripts/feeds clean -a
echo -e "\033[32m Strat $0 \033[0m"
cp $s_dir/tmp/feeds.conf.default feeds.conf.default
rm -rf $s_dir/tmp/*
rm -rf $root_dir/.config
rm -rf $work_dir/tmp/*
rm -rf $work_dir/app
rm -rf $work_dir/application
rm -rf $work_dir/dependency
echo -e "\033[32m All Clean Up ! \033[0m"
