
# 宿主机（树莓派）执行：把摄像头 /dev/video0 映射进容器
docker run --name facework -it --rm \
  --device=/dev/video0 \
  --network host \
  -v "$PWD:/workspace" \
  ubuntu:22.04 bash

# docker run = 启动一个“基于镜像的临时进程+文件系统”。

# --name learn1 给容器起名，后面好引用。
# 与--name=learn1等价

# -it 让你进到容器里的交互式 shell

# --rm 容器一退出就自动删除（干净练习，适合“学一步一清”）。

# --device=/dev/video0 把宿主机的 USB 摄像头映射进容器。

# --network host 用宿主机网络（先不用管细节，调试更省事）。

# -v "$PWD:/workspace" 把当前目录挂进容器（跨容器保存文件用）。

# ubuntu:22.04 是镜像；bash 是容器里的命令。

# 方式 A：使用“绑定挂载”（宿主机目录当外部卷） —— 推荐开发调试
mkdir -p ~/faceproj/data  # 存放你的人脸图片、编码等
docker run --rm -it \
  --name face_work \
  --device=/dev/video0 \
  --mount type=bind,src=$HOME/pro/face,dst=/data \
  --network host \
  arm64v8/ubuntu:22.04 \
  bash
