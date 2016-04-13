# 需要在emacs中 org导出为html文件
sh mv_html2post.sh
echo "copy files md and html"
git add -A
git status
git commit -m "$1"
git push -u origin master

