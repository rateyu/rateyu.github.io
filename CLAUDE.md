# rateyu.github.io

个人博客，GitHub Pages（Jekyll）从 `master` 分支自动构建发布。

## 写博客

- 文章放在 `_posts/`，文件名 `YYYY-MM-DD-标题.md`
- 开头加 front matter：`layout`、`title`、`date`、`tags`
- 在 `claude/...` 分支上提交并推送，通过 PR 合并到 `master` 后才会上线

## 发布后检查构建（重要）

合并到 `master` 后，GitHub 会自动运行 **pages-build-deployment** 工作流。

- 查看位置：仓库 → Actions → pages-build-deployment
- 2026-10-14 合并 PR #1 后第一次构建失败，没改任何代码，直接重新运行（Re-run）就成功了，所以失败可能是临时性的
- 遇到构建失败：
  1. 先打开失败那次运行的日志看报错。如果是文章格式问题（front matter、Liquid 语法 `{{ }}` / `{% %}` 等），就修改文章
  2. 如果报错和内容无关，就点 Re-run jobs 重新运行（手机 GitHub App 也可以操作）
  3. 重新运行后还失败，说明是真问题，要继续排查，不要反复重试
- 合并后一定要确认这个工作流是绿色 ✅，再认为文章已上线
