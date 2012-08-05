;; Changes made by the custom functionality are stored in custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Set path to .emacs.d
(setq dotfiles-dir "~/Dokumenter/dotFiles/emacs.d/")

;; Set path to dependencies
(setq site-lisp-dir (expand-file-name "site-lisp" dotfiles-dir))

;; Set up load path
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path site-lisp-dir)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(add-to-list 'load-path "~/Dokumenter/dotFiles/emacs.d/site-lisp/ess-12.04/lisp/")
(add-to-list 'load-path "~/Dokumenter/dotFiles/emacs.d/site-lisp/vimgolf/emacs/")
(add-to-list 'load-path "~/Dokumenter/dotFiles/emacs.d/site-lisp/org-7.8.11/lisp/")
(add-to-list 'load-path "~/Dokumenter/dotFiles/emacs.d/site-lisp/org-7.8.11/contrib/")

;; Set theme directory
(setq custom-theme-directory "~/.emacs.d/site-lisp/themes/")
(if (< emacs-major-version 23)
    (setq custom-theme-load-path "~/.emacs.d/site-lisp/themes/"))

;; Require some packages
(require 'find-file-in-project)
(require 'js2-mode)
(require 'multiple-cursors)
(require 'grep-edit)
(require 'paredit)
(require 'clojure-mode)
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
(require 'bibsnarf)
(require 'browse-kill-ring)
(require 'deft)
(require 'yasnippet)
(require 'smex)
(require 'erc)
(require 'mark-more-like-this)          ;Used for mark-multiple
(require 'inline-string-rectangle)      ;Used for mark-multiple
(require 'my-general)
(require 'my-programming)
(require 'my-folding)
(require 'my-defuns)
(require 'my-deft)
(require 'my-erc)
(require 'my-skeletons)
(require 'my-tabs)
(require 'my-latexstuff)
(require 'my-yasnippet)
(require 'my-registers)
(require 'my-dired)
(require 'my-wrap-region)
(require 'python)
(require 'ess-site)
(require 'vimgolf)
(require 'my-orgmode)
(require 'my-bindings)
