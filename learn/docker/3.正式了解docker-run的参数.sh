
# 宿主机（树莓派）执行：把摄像头 /dev/video0 映射进容器
docker run --name facework -it --rm \
  --device=/dev/video0 \
  --network host \
  -v "$PWD:/workspace" \
  ubuntu:22.04 bash
