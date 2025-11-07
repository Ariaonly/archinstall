
docker run --rm -it \
  --name face \
  --device=/dev/video0 \
  --mount type=bind,source="$HOME/project/face",target=/data \
  ubuntu:latest \
  /bin/bash
