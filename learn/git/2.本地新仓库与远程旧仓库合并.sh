
git init

git branch -m master main

# 1. 关联远程仓库（如果已关联可跳过）
git remote add origin git@github.com:Ariaonly/pi-face.git

# 2. 拉取远程仓库的所有对象
git fetch origin

# 3. 将本地 main 分支指向远程的 main（关键一步）
git reset --hard origin/main

# 4. 告诉git推到哪
git push --set-upstream origin main
