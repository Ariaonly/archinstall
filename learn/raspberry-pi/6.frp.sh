
serverAddr = "0.0.0.0"
serverPort = 10925

# [[proxies]]
# name = "ssh-tcp"
# type = "tcp"
# localIP = "127.0.0.1"
# localPort = 22
# remotePort = 6000

# 新增：转发本地 5854 端口的 Web 服务
[[proxies]]
name = "web-5854"
type = "tcp"
localIP = "127.0.0.1"
localPort = 5854
remotePort = 6001   # 映射到服务器上的 6001 端口（你也可以改成别的）


frpc -c frpc.toml
