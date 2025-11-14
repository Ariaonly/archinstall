
#由于防火墙的问题，配置代理是一个不错的选择
vim /etc/docker/daemon.json 

{
  "registry-mirrors": [
    "https://docker.mirrors.ustc.edu.cn",  
    "https://registry.docker-cn.com",
    "http://hub-mirror.c.163.com",  
    "https://docker.m.daocloud.io",
    "https://docker.xuanyuan.me",
    "https://mirror.ccs.tencentyun.com"
  ],
  "dns": ["8.8.8.8", "114.114.114.114"]
}

# 配置docker内的网络环境--x86
CODENAME=$(awk -F= '/VERSION_CODENAME/{print $2}' /etc/os-release)

cat >/etc/apt/sources.list <<EOF
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu ${CODENAME} main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu ${CODENAME}-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu ${CODENAME}-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu ${CODENAME}-security main restricted universe multiverse
EOF
apt update

# 配置docker内的网络环境--arm64
CODENAME=$(awk -F= '/VERSION_CODENAME/{print $2}' /etc/os-release)

cat >/etc/apt/sources.list <<EOF
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports ${CODENAME} main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports ${CODENAME}-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports ${CODENAME}-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports ${CODENAME}-security main restricted universe multiverse
EOF

# 安装ca-certificates，系统有了根证书，update-ca-certificates 把源导入 /etc/ssl/certs
apt-get install -y ca-certificates
update-ca-certificates

# 禁用官方源
mv /etc/apt/sources.list.d/ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources.disabled

apt-get update
