#!/bin/bash
echo -e "\033[32m Strat $0 \033[0m"
s_dir=$(cd "$(dirname "$0")";pwd)
$s_dir/start.sh
$s_dir/compile.sh
