#安装输入法
sudo pacman -S fcitx5 fcitx5-configtool fcitx5-rime 
###sudo pacman -S fcitx5-xim fcitx5-im
sudo pacman -S rime-pinyin-simp

#配置环境变量-----解决typora vscode 无法输入中文的问题
###但是当前有一个潜在问题，就是当我修改完后会导致vscode无法输入且关闭打开后问题依旧
mkdir -p ~/.config/environment.d
cat > ~/.config/environment.d/fcitx5.conf <<EOF2
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
EOF2

chown -R aria:aria /home/aria/.config

#vim ~/.config/environment.d/fcitx5.conf
# GTK_IM_MODULE=fcitx
# QT_IM_MODULE=fcitx
# XMODIFIERS=@im=fcitx
