;; Changes made by the custom functionality are stored in custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Add stuff to load-path
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/3rd-party/")
(add-to-list 'load-path "~/.emacs.d/3rd-party/magit-1.0.0/")
(add-to-list 'load-path "~/.emacs.d/3rd-party/deft/")
(add-to-list 'load-path "~/.emacs.d/3rd-party/vimgolf/emacs/")
(add-to-list 'load-path "~/.emacs.d/3rd-party/org-7.7/lisp/")
(add-to-list 'load-path "~/.emacs.d/3rd-party/org-7.7/contrib/lisp/")

;; Set theme directory
(setq custom-theme-directory "~/.emacs.d/3rd-party/themes/")

;; Require some packages
(require 'magit)
(require 'vimgolf)
(require 'yasnippet-bundle)
(require 'bibsnarf)
(require 'browse-kill-ring)
(require 'deft)
(require 'edit-server)
(require 'org-install)
(require 'smex)
(require 'erc)

;; Load various stuff
(load "my-general.el")
(load "my-folding.el")
(load "my-defuns.el")
(load "my-window-management.el")
(load "my-deft.el")
(load "my-erc.el")
(load "my-diff.el")
(load "my-skeletons.el")
(load "my-orgmode.el")
(load "my-tabs.el")
(load "my-latexstuff.el")
(load "my-bindings.el")
