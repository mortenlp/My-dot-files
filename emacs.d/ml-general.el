(server-start)

;; Gnus stuff
(require 'gnus)
(setq gnus-init-file "~/.emacs.d/ml-gnus.el")
(setq gnus-inhibit-startup-message t)

;; Set eshell directory
(setq eshell-directory-name "~/.emacs.d/eshell/")

;; Mail stuff
(setq user-mail-address "mortenlp2@gmail.com")
(setq user-full-name "Morten Leander Petersen")

;; Enable transient-mark-mode
(setq transient-mark-mode t)
(delete-selection-mode t)

;; Don't disable upcase/downcase functions
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Enable narrowing
(put 'narrow-to-region 'disabled nil)

;; Avoid mouse!!
(mouse-avoidance-mode 'banish)

;;; Set fill column to 80
(setq-default fill-column 80)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; See matching paranthesis
(show-paren-mode t)

;; Set default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")

;; Trailing whitespace is unnecessary
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; Smooth scrolling
(setq scroll-step 1 scroll-conservatively 10000)

;; Don't show scratch buffer text!
(setq initial-scratch-message nil)

;; Use the OS's monospaced font.
(setq font-use-system-font t)

;; Tramp
(setq tramp-default-method "ssh")

;; Represent undo-history as an actual tree (visualize with C-x u)
(setq undo-tree-mode-lighter "")
(require 'undo-tree)
(global-undo-tree-mode)

;; Don't show external ediff frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Side by side diff is the only way
(setq ediff-split-window-function 'split-window-horizontally)

;; Easy window management
(winner-mode t) ;; turn on the global minor mode

;;; Use system clipboard
(setq x-select-enable-clipboard t)

;;; Enable electric-pair-mode
(electric-pair-mode t)

;;; Use 'z' to kill an info buffer
(add-hook 'Info-mode-hook (lambda () (define-key Info-mode-map (kbd "z")
                                       'kill-this-buffer)))

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
