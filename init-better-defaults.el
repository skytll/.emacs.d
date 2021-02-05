;;关闭emacs警告音
(setq ring-bell-function 'ignore)
;; emacs自动加载外部修改的文件
(global-auto-revert-mode 1)
;; 显示行号
(global-linum-mode t)
;;缩写补全
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; Name of me
					    ("2tll" "Alex Tian")
					    ))
;; 关闭自动保存的文件
(setq auto-save-default nil)
;;最近打开文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
;;配置删除模式:选中输入字符会替换掉
(delete-selection-mode 1)

(provide 'init-better-defaults)
