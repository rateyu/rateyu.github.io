echo "******************************"
echo "需要在emacs中 org导出为html文件"
echo "******************************"

sh mv_html2post.sh
echo "copy files md and html"
sed -i '/24.5.1/'d ./orgs/*.html
sed -i '/Validate/'d ./orgs/*.html
git add -A
git status
git commit -m "$1"
git push -u origin master

