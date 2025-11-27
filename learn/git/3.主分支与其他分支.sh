
git switch main # 回到主分支

git switch -c feature/login  # 创建并进入新分支

git push -u origin feature/login # 将新分支上传到远程仓库

git switch main

# 把功能分支合并进来
git merge --no-ff better/path 
# 禁止 fast-forward
# 禁止 fast-forward
# 禁止 fast-forward
# 啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊 fuck 艹艹艹，妈的，一定要记住

git merge -X theirs better/path
# 所有文件以分支为主