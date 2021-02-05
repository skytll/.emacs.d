;;(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp")

;; package management
;; -----------------------------------------------------
(require 'init-packages)

(load-theme 'zenburn t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" default))
 '(package-selected-packages '(company zenburn-theme))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))

					; some basic setting
;; (require 'package)
;; (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;; (package-initialize) ;; You might already have this line

(tool-bar-mode -1)
(global-linum-mode -1)

;; start screen
(setq inhibit-splash-screen 1)

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

;;开启全局company补全
(global-company-mode 1)

;;配置删除模式:选中输入字符会替换掉
(delete-selection-mode 1)

;;当前行高亮
(global-hl-line-mode 1)

;;org模式文本语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;;最近打开文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 设置字体


;; emacs自动加载外部修改的文件
(global-auto-revert-mode 1)
;; 关闭自动保存的文件
(setq auto-save-default nil)
;;popwin自动将光标移动到新创建的窗口中
(require 'popwin)
(popwin-mode 1)
;;关闭emacs警告音
(setq ring-bell-function 'ignore)
;;yes和no简化
(fset 'yes-or-no-p 'y-or-n-p)
;;缩写补全
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; Name of me
					    ("2tll" "Alex Tian")
					    ))
;;增强Hippie补全
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))
;; Hippie快捷键
(global-set-key (kbd "s-/") 'hippie-expand)


;;Dired Mode 配置
;; 递归删除,拷贝
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
;; Emacs重用唯一的缓冲器作为Dired Mode显示专用缓冲区
(put 'dired-find-alternate-file 'disabled nil)
;;延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
;;启用c-x c-j 快捷键
(require 'dired-x)
;;当存在两个分屏,另一个分屏自动设置成拷贝地址的目标
(setq dired-dwim-target 1)

;;webmode 配置
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))
