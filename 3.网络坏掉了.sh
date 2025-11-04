
1.检查resolv.conf
ls -l /etc/resolv.conf
# 检查resolv为root拥有
# 并且权限为-rw-r--r--

2.重启并且自动启动systemd-resolved服务

3.检查符号链接符号目标
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

4.移除不可变属性
sudo chattr -i /etc/resolv.conf

5.重新创建符号链接
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

6.再次确认符号链接是否指向正确路径
ls -l /etc/resolv.conf