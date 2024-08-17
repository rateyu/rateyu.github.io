#!/bin/bash
cp ./orgs/*.md ./_posts/
cd ./orgs/
find ./ -type f -name '*.html' -exec sed -i '' 's/emacs_magit,org-mod/\/emacs_magit,org-mod/g' {} +
cd ../
mv ./orgs/*.html ./_posts/
cp ./orgs/emacs_magit,org-mod/* ./emacs_magit,org-mod/

