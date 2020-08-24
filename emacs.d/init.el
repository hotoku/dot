;;; el-git
(progn
  (add-to-list 'load-path "~/.emacs.d/el-get/el-get")
  (unless (require 'el-get nil 'noerror)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (add-to-list 'el-get-recipe-path "~/.emacs.d/recipes")
  (setq my-packages
	'(magit use-package browse-kill-ring session color-moccur auto-complete session
		helm equally-spaced open-junk-file projectile py-autopep8))
  (el-get 'sync my-packages)
  (el-get-cleanup my-packages))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;; backup
(progn
  (setq make-backup-files t)
  (setq backup-directory-alist
	(cons (cons "\\.*$" (expand-file-name "~/backup"))
	      backup-directory-alist)))

;;; key
(progn
  (global-set-key (kbd "C-x C-j") 'dired-jump)
  (global-set-key (kbd "C-c m") 'helm-mini))

;;; functions
(defun yh/sh-insert-var (var-name)
  (interactive "svariable name:")
  (insert "${" var-name "}"))

(show-paren-mode)

(add-hook 'sh-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "C-c C-j") 'yh/sh-insert-var)))

(add-hook 'emacs-lisp-mode-hook
	  '(lambda ()
	     (add-hook 'before-save-hook 'equally-spaced-make-gap-buffer :local t)
	     (hs-hide-all)))

(use-package dabbrev
  :config
  (setq dabbrev-case-fold-search nil))

(use-package magit
  :config
  (global-set-key (kbd "C-c g") 'magit))

(use-package equally-spaced)

(use-package hideshow
  :init
  (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode))

(use-package helm-config
  :init
  (require 'helm-config)
  (helm-mode 1)
  (setq helm-idle-delay 0.1)
  (setq helm-input-idle-delay 0.1)
  (setq helm-delete-minibuffer-contents-from-point t)
  (setq helm-ff-auto-update-initial-value nil)

  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
  (global-unset-key (kbd "C-x c"))

  :bind (("M-x" . helm-M-x)
	 ("M-y" . helm-show-kill-ring)
	 ("C-x C-f" . helm-find-files)
	 ("C-c h" . helm-command-prefix)
	 ("C-c h o" . helm-occur)))

(use-package projectile
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package py-autopep8
  :config
  (setq py-autopep8-options
	'("--max-line-length=300"
	  "--ignore=E402"))
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save))

;;; Local Variables:
;;; equally-spaced-width: 1
;;; End:
