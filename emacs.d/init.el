;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


;;; el-get
(progn 
  (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

  (unless (require 'el-get nil 'noerror)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
      (goto-char (point-max))
      (eval-print-last-sexp)))

  (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

  (setq my-packages
	'(magit use-package browse-kill-ring session color-moccur auto-complete session
		helm))

  (el-get 'sync my-packages)
  (el-get-cleanup my-packages))



(progn
  (setq make-backup-files t)
  (setq backup-directory-alist
	(cons (cons "\\.*$" (expand-file-name "~/backup"))
	      backup-directory-alist)))


(show-paren-mode)



(use-package dabbrev
  :config
  (setq dabbrev-case-fold-search nil))



(use-package magit
  :config
  (global-set-key (kbd "C-c g") 'magit))

