(setq debug-on-error t)
(setq tramp-verbose 10) ; 调整为需要的调试级别，10是非常详细的日志级别
;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(package-selected-packages '(magit)))
;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;)

;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(load-theme 'zenburn t)

(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch-popup))
  :config
  (defun mu-magit-kill-buffers ()
    "Restore window configuration and kill all Magit buffers."
    (interactive)
    (let ((buffers (magit-mode-get-buffers)))
      (magit-restore-window-configuration)
      (mapc #'kill-buffer buffers)))
  (bind-key "q" #'mu-magit-kill-buffers magit-status-mode-map))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes nil)
 '(package-selected-packages
   '(org-babel-eval-in-repl expand-region consult marginalia orderless vertico which-key ivy counsel-projectile ripgrep projectile vterm org-roam avy eyebrowse-restore eyebrowse realgud-ipdb realgud leetcode company smex find-file-in-project markdown-mode yasnippet-classic-snippets yasnippet use-package magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "nil" :slant normal :weight normal :height 130 :width normal)))))
(global-visual-line-mode 1)

(add-to-list 'load-path
                "~/.emacs.d/elpa/yasnippet-0.14.1/")
(require 'yasnippet)
(yas-global-mode 1)

(add-to-list 'load-path "~/.emacs.d/elpa/org-download/")
(require 'org-download)
(defun my/org-image-width-percentage (percent)
  "Calculate the pixel width of images in org-mode."
  (let ((width (round (* (display-pixel-width) (/ percent 100.0)))))
    (setq org-image-actual-width (list width))))

(my/org-image-width-percentage 50)  ; Set images to be 30% of the screen width


(setq eshell-buffer-maximum-lines 10000)  ; 增加 `eshell` 缓冲区可以保存的最大行数
(setq eshell-scroll-to-bottom-on-output 'all)  ; 输出时滚动到底部
(setq eshell-scroll-show-maximum-output t)  ; 显示尽可能多的输出


;;(add-hook 'eshell-mode-hook
;;          (lambda ()
;;            (setq truncate-lines nil)))

;; 全局启用视觉线折叠（Visual Line Mode）
;;(global-visual-line-mode 1)

;;(add-hook 'eshell-mode-hook
;;         (lambda ()
;;            (setq truncate-lines nil)))
;; 切换当前缓冲区的行截断
;;(global-set-key (kbd "C-c t") 'toggle-truncate-lines)


;;(setq org-image-actual-width '(300))

;(setq shell-file-name "/bin/bash")

;;(setq tramp-default-method "ssh")

;;(setq tramp-default-user-alist
;;      '(("192.168.1.13" "myu")
;;        ("192.168.1.153" "myu")))

;;(setq tramp-default-host-alist
;;      '(("hp13" "192.168.1.13")
;;        ("pc153" "192.168.1.153)))


;;; org-download
;;(add-to-list 'load-path
;;                "~/.emacs.d/elpa/org-download-20220906.1929/")
;;(require 'org-download)
;;(setq org-download-screenshot-method "flameshot gui --raw >%s")
; (setq org-download-method 'directory)
;;(setq-default org-download-heading-lvl nil)
;;(setq-default org-download-image-dir "./images")
;;(defun dummy-org-download-annotate-function (link)
 ;; "")
;;(setq org-download-annotate-function
;;      #'dummy-org-download-annotate-function)

;;(setq tramp-connection-timeout 10)
;;(use-package org-download)
;;  :config
;;  (setq-default org-download-heading-lvl nil)
;;  (setq-default org-download-image-dir "./images")
;;  (setq org-download-backend "wget")
;;  (setq org-download-abbreviate-filename-function (lambda (fn) fn)) ; use original filename
;;  (defun dummy-org-download-annotate-function (link)
;;    "")
;;  (setq org-download-annotate-function
;;	#'dummy-org-download-annotate-function)
;;  )


;; 启用 ido-mode -----
(ido-mode t)
;; 使 ido 支持文件和目录 提示
(setq ido-enable-flex-matching t)  ;; 启用模糊匹配
(setq ido-everywhere t)            ;; 全局启用 ido
(setq ido-create-new-buffer 'always) ;; 如果缓冲区不存在，自动创建

;; 命令提示 -----
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)


;; 加载 find-file-in-project -----用于文件名导航
(require 'find-file-in-project)

;; 设置 FFIP 的项目根目录检测规则
(setq ffip-project-file '(".git" ".projectile" "Makefile")) ;; 项目标识文件

;; 设置全局快捷键
(global-set-key (kbd "C-c p f") 'find-file-in-project) ;; 快速查找文件
(global-set-key (kbd "C-c p F") 'find-file-in-project-at-point) ;; 以当前光标单词为搜索关键字
;; 显示最近更改的文件
(global-set-key (kbd "C-c p l") 'ffip-show-diff-by-description)

;; 自定义忽略文件和目录 -----
(setq ffip-prune-patterns
      '("*/node_modules/*" "*/.git/*" "*/build/*" "*/dist/*"))

;; 支持特定文件类型的搜索
;;(setq ffip-patterns
;;      '("*.py" "*.java" "*.js" "*.html" "*.css" "*.cpp" "*.hpp" "*.go" "*.md" "*.org"))

;; 配置 grep-find/project-find-regexp 用于内容搜索 -----
(setq grep-find-template "rg --vimgrep --no-heading --color=never --encoding auto <R>")
(global-set-key (kbd "C-c p s") 'project-find-regexp) ;; 搜索项目中的内容

;;代码提示
(require 'company)

(global-company-mode t) ;; 启用全局补全
(setq company-idle-delay 0.0) ;; 补全菜单立即弹出
(setq company-minimum-prefix-length 1) ;; 输入一个字符后触发补全
(setq company-selection-wrap-around t) ;; 补全列表循环滚动


(add-to-list 'load-path "~/.emacs.d/leetcode-cn.el-master/")
(require 'leetcode)
(setq leetcode-prefer-language "java")
(setq leetcode-save-solutions t)
(setq leetcode-directory "~/leetcode")
(setq leetcode-prefer-sql "mysql")


;;(setenv "http_proxy" "http://localhost:7897")
;;(setenv "https_proxy" "http://localhost:7897")

;;(setq url-proxy-services
;;      '(("http" . "localhost:7897")
;;        ("https" . "localhost:7897")))
(setq chatgpt-shell-proxy "http://localhost:7897")
;;(setq chatgpt-shell-model-version "gpt-3.5-turbo")


(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"))


;;emacs 工作区配置
(add-to-list 'load-path "~/.emacs.d/elpa/eyebrowse-20240407.1342/")
(require 'eyebrowse)
(eyebrowse-mode t)

(global-set-key (kbd "C-c 1") 'eyebrowse-switch-to-window-config-1)  ;; 切换到工作区 1
(global-set-key (kbd "C-c 2") 'eyebrowse-switch-to-window-config-2)  ;; 切换到工作区 2
(global-set-key (kbd "C-c 3") 'eyebrowse-switch-to-window-config-3)  ;; 切换到工作区 3
(global-set-key (kbd "C-c 4") 'eyebrowse-switch-to-window-config-4)  ;; 切换到工作区 3
(global-set-key (kbd "C-c 5") 'eyebrowse-switch-to-window-config-5)  ;; 切换到工作区 3
(global-set-key (kbd "C-c 6") 'eyebrowse-switch-to-window-config-6)  ;; 切换到工作区 3
(global-set-key (kbd "C-c 7") 'eyebrowse-switch-to-window-config-7)  ;; 切换到工作区 3
(global-set-key (kbd "C-c 8") 'eyebrowse-switch-to-window-config-8)  ;; 切换到工作区 3
(global-set-key (kbd "C-c 9") 'eyebrowse-switch-to-window-config-9)  ;; 切换到工作区 3

(global-set-key (kbd "C-c n") 'eyebrowse-next-window-config)         ;; 切换到下一个工作区
(global-set-key (kbd "C-c p") 'eyebrowse-prev-window-config)         ;; 切换到上一个工作区
(global-set-key (kbd "C-c w") 'eyebrowse-save-window-config)         ;; 保存当前工作区
(global-set-key (kbd "C-c r") 'eyebrowse-rename-window-config)       ;; 重命名工作区

;; 启用 desktop-save-mode，以保存 Emacs 会话状态
(desktop-save-mode t)
(setq dired-use-ls-dired nil)

(setq desktop-dirname "~/.emacs.d/desktop/")
(setq desktop-base-file-name "desktop")
(setq desktop-base-lock-name "desktop.lock")
;;-save t)
(setq desktop-load-locked-desktop t)
;;(setq desktop-base-file-name "desktop")


(require 'winner)
(winner-mode 1)
(global-set-key (kbd "C-c <") 'winner-undo)         ;; 
(global-set-key (kbd "C-c >") 'winner-redo)       ;; 
;; 上面时窗口级别的，ctrl x/c 左右箭头是文件级别的


(global-set-key (kbd "C-c d") 'xref-find-definitions)  ;; 绑定到 C-c d
(global-set-key (kbd "C-c f") 'xref-find-references)   ;; 绑定到 C-c f


;;使用package-install安装后，可以直接使用avy，设置也可以使用，require
;;和use-package有什么区别？
(use-package avy
  :ensure nil  ;; 由于是离线安装，`ensure` 设为 `nil`
  :bind (("C-;" . avy-goto-char)       ;; 按字符跳转
         ("C-'" . avy-goto-char-2)     ;; 按两个字符跳转
         ("M-g w" . avy-goto-word-0)   ;; 按单词跳转
         ("M-g W" . avy-goto-word-1)   ;; 按单词首字母跳转
         ("M-g g" . avy-goto-line)))   ;; 按行跳转

;; 使用capture获取灵感 记录待办 记录笔记
(setq org-capture-templates
      '(("t" "Task" entry (file+headline "~/github/rateyu.github.io/orgs/tasks.org" "Tasks")
         "* TODO %?\n  %U")
        ("n" "Note" entry (file+headline "~/github/rateyu.github.io/orgs/notes.org" "Notes")
         "* %? :NOTE:\n  %U")
        ("i" "Idea" entry (file+headline "~/github/rateyu.github.io/orgs/ideas.org" "Ideas")
         "* %U %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/github/rateyu.github.io/orgs/journal.org")
         "* %U %?\n  %i\n  %a")))
(global-set-key (kbd "C-c t") (lambda () (interactive) (org-capture nil "t")))
(global-set-key (kbd "C-c n") (lambda () (interactive) (org-capture nil "n")))
(global-set-key (kbd "C-c i") (lambda () (interactive) (org-capture nil "i")))
(global-set-key (kbd "C-c j") (lambda () (interactive) (org-capture nil "j")))


;; 最近打开的文件
(recentf-mode 1)
(setq recentf-max-menu-items 500)  ;; 显示最近 25 个文件
(global-set-key (kbd "C-c C-r") 'recentf-open-files)


;;(add-to-list 'load-path "~/.emacs.d/org-roam-2.2.2")  ;; 替换为你的实际路径
;;(require 'org-roam)
;; 离线安装缺少依赖,改为自动安装
;;(use-package org-roam
;;  :ensure t)
;;(setq org-roam-directory "~/org-roam")  ;; 设置 org-roam 文件夹





;;(require 'org)
;;(setq org-refile-targets '((nil :maxlevel . 3)         ; Refile in current file, up to 3 levels deep
;;                          (org-agenda-files :maxlevel . 3))) ; Refile in agenda files
;;(setq org-refile-use-outline-path t)  ; Use outline path for refile (shows the full path of the entry)
;;(setq org-outline-path-complete-in-steps t) ; Refine the path completion in steps


;; 加入到日程列表里
(setq org-agenda-files (list "/Users/myu/github/rateyu.github.io/orgs/tasks.org"))
;; 我的文档结构 架构设计
(setq org-refile-targets '(( "/Users/myu/github/rateyu.github.io/orgs/todo.org" :maxlevel . 3)  ; 指定文件 todo.org，并限制最大层级为3
                           ( "/Users/myu/github/rateyu.github.io/orgs/journal.org" :maxlevel . 3)  ; 
                           ( "/Users/myu/github/rateyu.github.io/orgs/tasks.org" :maxlevel . 3)  ;指定文件 project.org，并限制最大层级为3
                           ( "/Users/myu/github/rateyu.github.io/orgs/ideas.org" :maxlevel . 3) 
			   ( "/Users/myu/github/rateyu.github.io/orgs/jiagou/001jiagou.org" :maxlevel . 3)
                           ( "/Users/myu/github/rateyu.github.io/orgs/notes.org" :maxlevel . 2)  ; 指定文件 notes.org，并限制最大层级为2
                          )) ; 还可以包含 agenda files 中的文件


(setq diary-file "~/github/rateyu.github.io/orgs/diary.org") 


(add-to-list 'load-path "~/.emacs.d/claude-code-ide.el")
(require 'claude-code-ide)

;; 启用 projectile
(projectile-mode +1)

;; 建议全局使用 C-c p 作为 prefix
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; 告诉 projectile 我的项目大概都放在哪些目录下面
;;(setq projectile-project-search-path
;;      '("~/github/"            ;; 这里放你的一堆项目
;;        "~/sources/"   ;; 这里放你个人项目
;	))

;; 可选：忽略一些目录
;; (setq projectile-globally-ignored-directories '("node_modules" "dist" ".git"))



;; 1) Emacs 统一 UTF-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-language-environment "UTF-8")

;; 2) counsel-rg 用 list，不用字符串
(setq counsel-rg-base-command
      '("rg"
        "--with-filename"
        "--no-heading"
        "--line-number"
        "--smart-case"
        "--color" "never"
        "%s"
        "."))

;; 3) 中文项目里常用：搜索所有文件（含 hidden/ignored）
(defun my-counsel-projectile-rg-all ()
  (interactive)
  (counsel-rg nil (projectile-project-root) "-uu"))

;; 4) 老项目 GBK/GB18030 专用
(defun my-counsel-projectile-rg-gbk ()
  (interactive)
  (let ((counsel-rg-base-command
         '("rg"
           "--with-filename"
           "--no-heading"
           "--line-number"
           "--smart-case"
           "--color" "never"
           "--encoding" "gb18030"
           "%s"
           ".")))
    (counsel-projectile-rg)))


;; emacs & tmux 复制粘贴统一
(setq select-enable-clipboard t)


