
# 修改树莓派上ubuntu的源
sudo sed -i 's#http://ports.ubuntu.com/ubuntu-ports#https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports#g' \
/etc/apt/sources.list.d/ubuntu.sources

# 或者换成阿里云的源
sudo sed -i 's#http://ports.ubuntu.com/ubuntu-ports#https://mirrors.aliyun.com/ubuntu-ports#g' /etc/apt/sources.list.d/ubuntu.sources
sudo apt update
sudo apt upgrade

# ubuntu-ports 是 ARM 架构（树莓派用的），不要用 ubuntu 镜像，否则会 404。