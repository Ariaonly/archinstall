
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

#拉取其他架构的镜像---我是为了在树莓派上使用
docker pull --platform=linux/arm64 ubuntu:24.04

# 打包成 tar
docker save -o ubuntu24_arm64.tar ubuntu:24.04

scp ubuntu24_arm64.tar pi@<Pi的IP>:/home/pi/

# 加载镜像
docker load -i ubuntu24_arm64.tar

docker image inspect ubuntu:24.04 --format '{{.Os}}/{{.Architecture}}' # 期待输出：linux/arm64


CODENAME=$(awk -F= '/VERSION_CODENAME/{print $2}' /etc/os-release)

cat >/etc/apt/sources.list <<EOF
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu ${CODENAME} main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu ${CODENAME}-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu ${CODENAME}-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu ${CODENAME}-security main restricted universe multiverse
EOF

apt update

