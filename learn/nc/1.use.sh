
sudo pacman -S openbsd-netcat

# 测试目标主机某个端口是否开放
nc ip 8080 
nc -zv 192.168.1.10 1-1000
