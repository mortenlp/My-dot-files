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
(add-to-list 'load-path "~/.emacs.d/3rd-party/themes/emacs-color-theme-solarized/")
(setq load-path (cons "~/.emacs.d/3rd-party/org-7.7/lisp/" load-path))
(setq load-path (cons "~/.emacs.d/3rd-party/org-7.7/contrib/lisp/" load-path))

;; Load various stuff
(load "vimgolf.el")
(load "my-window-management.el")
(load "my-deft.el")
(load "bibsnarf.el")
(load "my-erc.el")
(load "my-colors.el")
(load "my-diff.el")
(load "my-skeletons.el")
(load "my-orgmode.el")
(load "my-tabs.el")
(load "emacs_abbrev.el")
(load "my-latexstuff.el")
(load "browse-kill-ring.el")
(load "my-general.el")
(load "my-bindings.el")

;; Require some packages
(require 'yasnippet-bundle)
(require 'magit)
(require 'vimgolf)
