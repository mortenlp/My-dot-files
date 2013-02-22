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

;; Set theme directory
(setq custom-theme-directory "~/.emacs.d/themes/")
(if (< emacs-major-version 23)
    (setq custom-theme-load-path "~/.emacs.d/themes/"))

;; Packages
(when (not (require 'package nil t))
  (require 'package "package-23.el"))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(when (null package-archive-contents)
  (package-refresh-contents))

;; Install extensions if they're missing
(load "ml-package.el")

(defun init--install-packages ()
  (packages-install
   (cons 'expand-region melpa)
   (cons 'multiple-cursors melpa)
   (cons 'clojure-mode marmalade)
   (cons 'browse-kill-ring marmalade)
   (cons 'csharp-mode marmalade)
   (cons 'deft marmalade)
   (cons 's melpa)
   (cons 'dired-details marmalade)
   (cons 'evil-numbers marmalade)
   (cons 'smex marmalade)
   (cons 'magit melpa)
   (cons 'js2-mode melpa)
   (cons 'markdown-mode marmalade)
   (cons 'lorem-ipsum marmalade)
   (cons 'paredit melpa)
   (cons 'rainbow-mode melpa)
   (cons 'starter-kit-eshell marmalade)
   (cons 'wgrep marmalade)
   (cons 'ace-jump-mode marmalade)
   (cons 'ido-ubiquitous marmalade)
   (cons 'solarized-theme melpa)
   (cons 'zenburn-theme marmalade)
   (cons 'undo-tree melpa)
   (cons 'ess melpa)
   (cons 'auctex gnu)
   (cons 'yasnippet melpa)
   (cons 'diminish melpa)
   (cons 'inf-ruby melpa)
   (cons 'fill-column-indicator melpa)
   (cons 'wrap-region melpa)
   (cons 'projectile melpa)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Require some packages
(require 'ace-jump-mode)
(require 'ess-site)
(require 'screencast nil t)
(require 'org-install)
(require 'ido-ubiquitous)
(require 'epresent nil t)
(require 'yasnippet)
(require 'java-refactor)

;; Load various stuff
(load "ml-appearance.el")
(load "ml-general.el")
(load "ml-programming.el")
(load "ml-projectile.el")
(load "ml-defuns.el")
(load "ml-deft.el")
(load "ml-recentf.el")
(load "ml-erc.el")
(load "ml-skeletons.el")
(load "ml-orgmode.el")
(load "ml-hippie.el")
(load "ml-latexstuff.el")
(load "ml-bindings.el")
(load "ml-yasnippet.el")
(load "ml-registers.el")
(load "ml-dired.el")
(load "ml-wrap-region.el")
(load "ml-eshell.el")
(load "ml-magit.el")
(load "ml-ido.el")
