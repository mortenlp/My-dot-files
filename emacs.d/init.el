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
(add-to-list 'load-path "~/.emacs.d/plugins/expand-region/")
(add-to-list 'load-path "~/.emacs.d/plugins/vimgolf/emacs/")
(add-to-list 'load-path "~/.emacs.d/plugins/org-7.8.06/lisp/")
(add-to-list 'load-path "~/.emacs.d/plugins/org-7.8.06/contrib/lisp/")
(add-to-list 'load-path "~/.emacs.d/plugins/themes/")
(add-to-list 'load-path "~/.emacs.d/plugins/ess-12.04/lisp/")
(add-to-list 'load-path "~/.emacs.d/plugins/mark-multiple/")

;; Set theme directory
(setq custom-theme-directory "~/.emacs.d/plugins/themes/")
(if (< emacs-major-version 23)
    (setq custom-theme-load-path "~/.emacs.d/plugins/themes/"))

;; Require some packages
(require 'paredit)
(require 'clojure-mode)
(require 'ess-site)
(require 'python)
(require 'ido-ubiquitous)
(require 'ace-jump-mode)
(require 'screencast)
(require 'org-install)
(require 'csharp-mode)
(require 'evil-numbers)
(require 'rainbow-mode)
(require 'expand-region)
(require 'lorem-ipsum)
(require 'epresent)
(require 'markdown-mode)
(require 'magit)
(require 'starter-kit-eshell)
(require 'vimgolf)
(require 'bibsnarf)
(require 'browse-kill-ring)
(require 'deft)
(require 'yasnippet)
(require 'smex)
(require 'erc)
(require 'mark-more-like-this)          ;Used for mark-multiple
(require 'inline-string-rectangle)      ;Used for mark-multiple


;; Load various stuff
(load "my-general.el")
(load "my-programming.el")
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
(load "my-registers.el")
