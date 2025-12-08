
env GOOS=linux GOARCH=arm64 CGO_ENABLED=0 \
    go build -o app-rpi
