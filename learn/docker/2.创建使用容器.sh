
docker pull ubuntu  #加上:版本，也可以不加,自动选择最新版本

docekr images                       # 查看当前有哪些docker镜像

docker run # 这个查看dockerrun的教程

docker ps                           # 查看容器
-a                                  # 查看所有容器
-aq                                 # 查看所有容器的id

docker exec -it c2 /bin/bash        # 进入c2这个容器

docker stop c2                      # 关闭守护式容器c2

docker rm c2                        # 删除容器
docker rm 'docker ps -aq'           # 删除所有容器

docker inspect c2                   # 容器信息

# ===========================================================================

#拉取其他架构的镜像---我是为了在树莓派上使用
docker pull --platform=linux/arm64 ubuntu:24.04

# 打包成 tar
docker save -o ubuntu24_arm64.tar ubuntu:24.04

# 传输到树莓派上
scp ubuntu24_arm64.tar pi@<Pi的IP>:/home/pi/

# 加载镜像
docker load -i ubuntu24_arm64.tar

# 查看镜像的架构
docker image inspect ubuntu:24.04 --format '{{.Os}}/{{.Architecture}}' # 期待输出：linux/arm64

# 打包成镜像
docker commit face face_recog:pi5


# ===========================docker run=======================================

docker run --rm -it \
  --name face \
  --device=/dev/video0 \
  --mount type=bind,source="$HOME/project/face",target=/data \
  --network host \
  ubuntu:latest \
  /bin/bash

# --rm是退出当前容器后容器自动销毁
# --name是命名该docker
# --device=/dev/video0 把宿主机的摄像头映射进容器
# --mount type=bind,...把宿主机目录 ~/faceproj/data 挂到容器的 /data，外挂数据卷
# --network host 用宿主机网络

docker run --rm -it --name face \
  --device=/dev/video0 \
  --mount type=bind,source="$HOME/pro/face",target=/data \
  --network host \
  ubuntu:24.04 \
  /bin/bash

docker run -it --name=c1 ubuntu:24.04 /bin/bash            
# -i 表示保持运行
# -t 表示分配一个终端来运行并立即进入
# -it表示创建时自动进入，退出后容器自动关闭，被称为交互式容器   
# -d 表示创建一个容器不会立即进入
# -id表示创建容器，在后台运行，需要docker exec进入容器，退出后不会立即关闭，被称为守护式容器
# --name= 表示起名字
# -回车后会直接进入容器内部

docker run --rm -it \
  --name=face1 \
  --device=/dev/video0 \
  --mount type=bind,source="$HOME/pro/face",target=/data \
  --network host \
  face_recog:pi5 \
  /bin/bash


# ==========================================================================

#我查看设备有没有挂载进来的工具
apt-get install -y v4l-utils
v4l2-ctl --list-devices

# ===========================================================================

docker commit face face_recog:pi5
docker tag face_recog:pi5 face_recog:pi5-v1
