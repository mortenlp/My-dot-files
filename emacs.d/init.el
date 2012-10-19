;; Changes made by the custom functionality are stored in custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Add stuff to load-path
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/themes/")

;; Add external projects to load path
(dolist (project (directory-files "~/.emacs.d/site-lisp/" t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(add-to-list 'load-path "~/.emacs.d/site-lisp/org/lisp/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/org/contrib/lisp/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/ess/lisp/")

;; Set theme directory
(setq custom-theme-directory "~/.emacs.d/themes/")
(if (< emacs-major-version 23)
    (setq custom-theme-load-path "~/.emacs.d/themes/"))

;; Packages
(when (not (require 'package nil t))
  (require 'package "package-23.el"))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/")
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(when (null package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(projectile expand-region multiple-cursors mark-multiple
                                 clojure-mode browse-kill-ring csharp-mode deft
                                 s dired-details evil-numbers smex magit js2-mode
                                 markdown-mode lorem-ipsum paredit rainbow-mode
                                 starter-kit-eshell wgrep))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Require some packages
(require 'ess-site)
(require 'screencast)
(require 'org-install)
(require 'ido-ubiquitous)
(require 'epresent)
(require 'yasnippet)

;; Load various stuff
(load "my-general.el")
(load "my-programming.el")
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
