;; Changes made by the custom functionality are stored in custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Gnus stuff
(require 'gnus)
(setq gnus-init-file "~/Dokumenter/dotFiles/my-gnus.el")
(setq gnus-inhibit-startup-message t)

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
(require 'vimgolf)
(load "my-window-management.el")
(load "my-deft.el")
(load "bibsnarf.el")
(load "my-erc.el")
(load "my-colors.el")
(load "my-diff.el")
(load "my-bindings.el")
(load "my-skeletons.el")
(load "my-orgmode.el")
(load "my-tabs.el")
(load "emacs_abbrev.el")
(load "my-latexstuff.el")
(load "browse-kill-ring.el")
(load "my-general.el")

;; yasnippet
(require 'yasnippet-bundle)

;; Magit
(require 'magit)

;; Set font
;; (set-default-font "DejaVu Sans Mono-9")
(set-default-font "Ubuntu Mono-11")
;; (set-default-font "Monaco-10")

;; Doc-View auto revert
;; (add-hook 'doc-view-mode-hook 'auto-revert-mode)

;; w3m stuff
(if (locate-library "w3m")
    (progn (setq w3m-use-cookies t)
           (setq mm-w3m-safe-url-regexp nil)
           (setq w3m-default-display-inline-images t)
           (require 'mime-w3m)))

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

;; Don't disable upcase/downcase functions
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Required for emacs editing in chromium to work
(require 'edit-server)
(edit-server-start)

;; Google it!
(defun google nil
  "Google something."
  (interactive)
  (let (arg)
    (if mark-active
        (setq arg (buffer-substring (region-beginning) (region-end)))
      (setq arg (read-from-minibuffer "Search term: ")))
    (browse-url (format "http://www.google.dk/search?q=%s" arg))))
(global-set-key [(control c) (g)] 'google)

;; Paste things to ansi-term
(defun my-term-paste (&optional string)
  (interactive)
  (process-send-string
   (get-buffer-process (current-buffer))
   (if string string (current-kill 0))))
(global-set-key [(control c) (y)] 'my-term-paste)
