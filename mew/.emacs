(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
;; 设置w3m主页
(setq w3m-home-page "http://www.baidu.com")

;; mew收发邮件配置
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
(setq mew-use-cached-passwd t)
(setq mew-pop-delete nil)
;; Optional setup (Read Mail menu for Emacs 21):
(if (boundp 'read-mail-command)
    (setq read-mail-command 'mew))
;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))
(when (boundp 'utf-translate-cjk)
  (setq utf-translate-cjk t)
  (custom-set-variables
   '(utf-translate-cjk t)))
(if (fboundp 'utf-translate-cjk-mode)
    (utf-translate-cjk-mode 1))
;;用w3m来读html格式邮件
(setq mew-mime-multipart-alternative-list '("Text/Html" "Text/Plain" "*."))
(condition-case nil
    (require 'mew-w3m)
  (file-error nil))
(setq mew-use-text/html t)
;;mail account config
(setq mew-config-alist
      '(
;;	("default"
;;	 (pop-server "pop.126.com")
;;	 (name "126")
;;	 (user "chenbin512")
;;	 (mail-domain "126.com")
;;	 (pop-auth pass)
;;	 (pop-user "chenbin512@126.com")
;;	 (smtp-user "chenbin512@126.com")
;;	 (smtp-server "smtp.126.com")
;;	 )
;;	("gmail"
;;	 (pop-server "127.0.0.1")
;;	 (pop-port 9959)
;;	 (name "gmail")
;;	 (user "chenbin512")
;;	 (mail-domain "gmail.com")
;;	 (pop-auth pass)
;;	 (pop-user "chenbin512@gmail.com")
;;	 (smtp-user "chenbin512@gmail.com")
;;	 (smtp-server "127.0.0.1")
;;	 (smtp-port 4659)
;;	 )
	("default"
	 (pop-server "pop.163.com")
	 (name "163")
	 (user "y81212")
	 (mail-domain "163.com")
	 (pop-auth pass)
	 (pop-user "y81212@163.com")
	 (smtp-user "y81212@163.com")
	 (smtp-server "smtp.163.com")
	 )
	)
      )
;;设置邮件签名档
;;(setq mew-signature-file "~/Mail/signature")
;;(setq mew-signature-as-lastpart t)
;;(setq mew-signature-insert-last t)
;;(add-hook 'mew-before-cite-hook 'mew-header-goto-body)
;;(add-hook 'mew-draft-mode-newdraft-hook 'mew-draft-insert-signature)
;;设置邮件分类
(setq mew-refile-guess-alist
      '(("To:"
	 ("@126.com" . "+Mail/126")
	 ("@gmail.com" . "+Mail/gmail")
	 ("@163.com" . "+Mail/163"))
	("Cc:"
	 ("@126.com" . "+Mail/126")
	 ("@gmail.com" . "+Mail/gmail")
	 ("@163.com" . "+Mail/163"))
	(nil . "+inbox")))
(setq mew-refile-guess-control
      '(mew-refile-guess-by-alist))
;;设置邮件显示栏目
(setq mew-summary-form
      '(type (10 date) " " (40 from) " " t (0 subj)))
(setq mew-summary-form-extract-rule '(name))
