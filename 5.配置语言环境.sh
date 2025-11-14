
# （可选）中国大陆推荐：设置代理镜像，加速拉包
go env -w GOPROXY=https://goproxy.cn,direct
go env -w GOSUMDB=sum.golang.org

# 确保 $GOBIN 在 PATH 里（没有就导出 GOPATH/bin）
export GOBIN="$(go env GOBIN)"
[ -z "$GOBIN" ] && export GOBIN="$(go env GOPATH)/bin"
mkdir -p "$GOBIN"
case ":$PATH:" in *":$GOBIN:"*) ;; *) export PATH="$GOBIN:$PATH";; esac

# 一次性安装 VS Code 常用的 Go 工具
TOOLS=(
  golang.org/x/tools/gopls                            # 语言服务
  github.com/go-delve/delve/cmd/dlv                   # 调试器
  golang.org/x/tools/cmd/goimports                    # 自动导包/格式化
  mvdan.cc/gofumpt                                    # 更严格的格式化（可选）
  honnef.co/go/tools/cmd/staticcheck                  # 静态检查
  github.com/golangci/golangci-lint/cmd/golangci-lint # 代码规范整套（可选）
  github.com/uudashr/gopkgs/v2/cmd/gopkgs             # 包/符号索引
  github.com/ramya-rao-a/go-outline                   # 大纲视图支持
  github.com/cweill/gotests/gotests                   # 生成测试
  github.com/fatih/gomodifytags                       # 结构体 tag 批量修改
  github.com/josharian/impl                           # 生成接口实现
  github.com/haya14busa/goplay/cmd/goplay             # Playground 本地化（可选）
)
for t in "${TOOLS[@]}"; do
  echo "Installing $t@latest ..."
  go install "$t@latest"
done
