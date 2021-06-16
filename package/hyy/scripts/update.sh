#!/bin/bash
# 定义全局变量
# $s_dir 脚本所在目录
s_dir=$(
  cd "$(dirname "$0")"
  pwd
)
# $root_dir 脚本执行目录
root_dir=$(pwd)
# $work_dir 工作目录
work_dir=$root_dir/package/mydiy
# $work_dis 临时目录存放所需文件
work_dis=~/dis_temp
# 脚本开始，设置输出文字的颜色
echo -e "\033[32m Strat $0 \033[0m"
# 判断临时目录（存放需要修改不能git pull的内容）是否存在
if [ -e $work_dis ]; then
  # 存在时使用git pull脚本进行与源仓库的同步。
  $s_dir/gitpull.sh $work_dis
# 不存在时执行
elif [ ! -d $work_dis ]; then
  # 创建目录
  mkdir -vp $work_dir
  # 克隆需要修改的插件到临时目录中
  git clone https://github.com/kenzok8/openwrt-packages.git $work_dis/kenzok8
  git clone https://github.com/Lienol/openwrt-package.git $work_dis/lienol
  git clone https://github.com/hyy-666/luci-app-dockerman.git $work_dis/luci-app-dockerman
  # 输出添加不需要修改的软件成功
  echo -e "\033[32m Add App Success \033[0m"
fi
# 判断application（存放需要修改的创建目录）目录是否存在，不存在就创建
if [ ! -d $work_dir/application ]; then
  mkdir -vp $work_dir/application
fi
# 执行openwrt固件自带的升级脚本
$root_dir/scripts/feeds update -a
# --------------冲突处理单元--------------
# 删除lean的argon与要添加的插件相冲突
rm -rf $root_dir/package/lean/luci-theme-argon
# 删除lean的aria2与要添加的插件相冲突
rm -rf $root_dir/feeds/packages/net/aria2
# ---------------------------------------
# 清理工作目录
rm -rf $work_dir/application/*
# 提示清理完毕
echo -e "\033[32m Clean Up ! \033[0m"
# 复制修改完的插件到工作目录
cp -r $work_dis/lienol/luci-app-filebrowser $work_dir/application
cp -r $work_dis/kenzok8/luci-app-adguardhome $work_dir/application
cp -r $work_dis/kenzok8/luci-app-clash $work_dir/application
cp -r $work_dis/kenzok8/luci-app-openclash $work_dir/application
cp -r $work_dis/kenzok8/luci-app-smartdns $work_dir/application
cp -r $work_dis/luci-app-dockerman/applications/luci-app-dockerman $work_dir/application
cp -r $work_dis/kenzok8/AdGuardHome $work_dir/dependency
cp -r $work_dis/kenzok8/smartdns $work_dir/smartdns
# 检索安装所有已有插件到编译环境
$root_dir/scripts/feeds install -a
# 上一条指令执行正常则输出以下语句
if [ $? ]; then
  echo -e "\033[32m Install Feeds Well \033[0m"
else
  # 异常输出
  echo -e "\033[31m Install Feeds Fail ! \033[0m"
  exit 1
fi
