;; Changes made by the custom functionality are stored in custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Add stuff to load-path
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;; Add external projects to load path
(dolist (project (directory-files "~/.emacs.d/site-lisp/" t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(add-to-list 'load-path "~/.emacs.d/site-lisp/vimgolf/emacs/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/org/lisp/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/org/contrib/lisp/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/ess/lisp/")

;; Set theme directory
(setq custom-theme-directory "~/.emacs.d/site-lisp/themes/")
(if (< emacs-major-version 23)
    (setq custom-theme-load-path "~/.emacs.d/site-lisp/themes/"))

;; Require some packages
(require 'projectile)
(require 'js2-mode)
(require 'multiple-cursors)
(require 'wgrep)
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

;; Load various stuff
(load "my-general.el")
(load "my-programming.el")
(load "my-folding.el")
(load "my-defuns.el")
(load "my-deft.el")
(load "my-erc.el")
(load "my-skeletons.el")
(load "my-orgmode.el")
(load "my-hippie.el")
(load "my-latexstuff.el")
(load "my-bindings.el")
(load "my-yasnippet.el")
(load "my-registers.el")
(load "my-dired.el")
