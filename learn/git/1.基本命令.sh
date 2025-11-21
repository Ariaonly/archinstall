

# 1.标识自己的身份

git config --global user.name "你的名字"
git config --global user.email "you@example.com"

# 修改用户名或者邮箱
git config user.email "you@example.com"

# 测试
ssh -T git@github.com

# 2.创建项目 或者克隆
mkdir ****
git init 

git clone git@github.com:Ariaonly/archinstall.git

git branch                  # 查看当前分支
git fetch                   # 仅获取远程更新
git pull                    # 获取并合并
git pull --rebase           # 获取并线性整合，历史更直

git push                    # 推送

git status                  # 查看当前的状态，比如修改哪些文件，创建哪些文件
git log                     # 查看历史提交的记录