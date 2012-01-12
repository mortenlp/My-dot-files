;; Changes made by the custom functionality are stored in custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Add stuff to load-path
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'load-path "~/.emacs.d/plugins/magit-1.0.0/")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet/")
(add-to-list 'load-path "~/.emacs.d/plugins/deft/")
(add-to-list 'load-path "~/.emacs.d/plugins/vimgolf/emacs/")
(add-to-list 'load-path "~/.emacs.d/plugins/org-7.7/lisp/")
(add-to-list 'load-path "~/.emacs.d/plugins/org-7.7/contrib/lisp/")

;; Set theme directory
(setq custom-theme-directory "~/.emacs.d/plugins/themes/")

;; Require some packages
(require 'markdown-mode)
(require 'magit)
(require 'starter-kit-eshell)
(require 'vimgolf)
(require 'bibsnarf)
(require 'browse-kill-ring)
(require 'deft)
(require 'yasnippet)
(require 'org-install)
(require 'smex)
(require 'erc)

;; Load various stuff
(load "my-general.el")
(load "my-folding.el")
(load "my-defuns.el")
(load "my-deft.el")
(load "my-erc.el")
(load "my-skeletons.el")
(load "my-orgmode.el")
(load "my-tabs.el")
(load "my-latexstuff.el")
(load "my-bindings.el")
(load "my-yasnippet.el")
