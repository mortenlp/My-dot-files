;; Changes made by the custom functionality are stored in custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Add stuff to load-path
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/3rd-party/")
(add-to-list 'load-path "~/.emacs.d/3rd-party/magit-1.0.0/")
(setq load-path (cons "~/.emacs.d/3rd-party/org-7.7/lisp/" load-path))
(setq load-path (cons "~/.emacs.d/3rd-party/org-7.7/contrib/lisp/" load-path))

;; Load various stuff
(load "bitlbee.el")
(load "my-colors.el")
(load "my-diff.el")
(load "my-bindings.el")
(load "my-skeletons.el")
(load "my-orgmode.el")
(load "my-tabs.el")
(load "emacs_abbrev.el") ;; Xah Lee's abbrevs.
(load "my-latexstuff.el")
(load "browse-kill-ring.el")
(load "my-general.el")

;; yasnippet
(require 'yasnippet-bundle)

;; Magit
(require 'magit)

;; Set font
(set-default-font "DejaVu Sans Mono-9")

;; Doc-View auto revert
;; (add-hook 'doc-view-mode-hook 'auto-revert-mode)

;; Don't show startup message in gnus
(setq gnus-inhibit-startup-message t)

;; w3m stuff
(setq w3m-use-cookies t)
(setq mm-w3m-safe-url-regexp nil)
(setq w3m-default-display-inline-images t)
(require 'mime-w3m)

;; Auto-new-line
(add-hook 'c-mode-common-hook
          (lambda () (c-toggle-auto-newline 1)))

;; Switch between header and source file
(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

;; Abbrevs
(setq default-abbrev-mode t)

;; Default etags name
(setq tags-file-name "TAGS")

;; Don't use tabs when indenting!!
(setq-default indent-tabs-mode nil)

;; full screen toggle using F11
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                         'fullboth)))
(global-set-key [(f11)] 'toggle-fullscreen)

;; Folding mode
(load "folding" 'nomessage 'noerror)
(folding-add-to-marks-list 'haskell-mode "--{{{"  "--}}}"  nil t)
(folding-mode-add-find-file-hook)
(add-hook 'haskell-mode-hook 'folding-mode)
(folding-add-to-marks-list 'tuareg-mode "(*{{{"  "(*}}}*)"  nil t)
(add-hook 'tuareg-mode-hook 'folding-mode)

;; Tramp
(setq tramp-default-method "ssh")

;; Mail stuff
(setq user-mail-address "mortenlp2@gmail.com")
(setq user-full-name "Morten Leander Petersen")
