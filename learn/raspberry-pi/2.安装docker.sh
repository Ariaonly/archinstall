
lsb_release -a
uname -m

# 输出
# No LSB modules are available.
# Distributor ID:	Ubuntu
# Description:	Ubuntu 25.04
# Release:	25.04
# Codename:	plucky
# aarch64

# 删除旧 key 或源干扰
sudo rm -f /etc/apt/keyrings/docker.gpg
sudo rm -f /etc/apt/sources.list.d/docker.list
sudo install -m 0755 -d /etc/apt/keyrings

# 设置变量（plucky → noble）
# Docker 官方暂未支持 plucky，我们暂时替换为 noble：
CODENAME=$(. /etc/os-release && echo "$VERSION_CODENAME")
if [ "$CODENAME" = "plucky" ]; then CODENAME=noble; fi

# 导入清华的 Docker GPG Key
curl -fsSL https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu/gpg \
  | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# 写入清华的 Docker CE 源
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu ${CODENAME} stable" \
| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 更新并安装 Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 启用与开机自启
sudo systemctl enable --now docker

# 让当前用户免 sudo 运行 docker
sudo usermod -aG docker $USER

# 最后要重启