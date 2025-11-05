

docekr images                       # 查看当前有哪些docker镜像

docekr run -it --name=c1 ubuntu:latest /bin/bash            
# -i 表示保持运行
# -t 表示分配一个终端来运行并立即进入
# -it表示创建时自动进入，退出后容器自动关闭，被称为交互式容器   
# -d 表示创建一个容器不会立即进入
# -id表示创建容器，在后台运行，需要docker exec进入容器，退出后不会立即关闭，被称为守护式容器
# --name= 表示起名字
# -回车后会直接进入容器内部

docker ps                           # 查看容器
-a                                  # 查看所有容器
-aq                                 # 查看所有容器的id

docker exec -it c2 /bin/bash        # 进入c2这个容器

docker stop c2                      # 关闭守护式容器c2

docker rm c2                        # 删除容器
docker rm 'docker ps -aq'           # 删除所有容器

docker inspect c2                   # 容器信息