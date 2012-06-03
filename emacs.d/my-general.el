;; Gnus stuff
(require 'gnus)
(setq gnus-init-file "~/.emacs.d/my-gnus.el")
(setq gnus-inhibit-startup-message t)
(ido-ubiquitous-disable-in mml-attach-file)

;; Set eshell directory
(setq eshell-directory-name "~/.emacs.d/eshell/")

;; Set color if using X
(cond
 ((and (< emacs-major-version 24) (eq window-system 'x))
  (load-theme 'tomorrow-night-eighties))
 ((and (>= emacs-major-version 24) (eq window-system 'x))
  (load-theme 'tomorrow-night-eighties t))
 )

;; Mail stuff
(setq user-mail-address "mortenlp2@gmail.com")
(setq user-full-name "Morten Leander Petersen")

;; Tooltip mode off
(tooltip-mode -1)

;; Visible bell
(setq visible-bell t)

;; Ido mode
(ido-mode t)
(setq ido-enable-flex-matching t)
(ido-ubiquitous)
(smex-initialize)

;; Don't show startup screen
(setq inhibit-startup-screen t)

;; Enable transient-mark-mode
(setq transient-mark-mode t)
(delete-selection-mode t)
;; (set-face-foreground 'region "white")
;; (set-face-background 'region "dark slate gray")

;; Explicitly show the end of a buffer
(set-default 'indicate-empty-lines t)

;; No bars
(when (fboundp 'toggle-scroll-bar)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1))

;; Don't disable upcase/downcase functions
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Enable narrowing
(put 'narrow-to-region 'disabled nil)

;; Don’t blink the cursor
(blink-cursor-mode 0)

;; Display line and column numbers
(setq line-number-mode    t)
(setq column-number-mode  t)

;; Avoid mouse!!
(mouse-avoidance-mode 'jump)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; See matching paranthesis
(show-paren-mode t)

;; Set default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "conkeror")

;; Trailing whitespace is unnecessary
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; Smooth scrolling
(setq scroll-step 1 scroll-conservatively 10000)

;; Don't show scratch buffer text!
(setq initial-scratch-message nil)

;; Use the OS's monospaced font.
(setq font-use-system-font t)

;; Doc-View auto revert
;; (add-hook 'doc-view-mode-hook 'auto-revert-mode)

;; w3m stuff
(if (locate-library "w3m")
    (progn (setq w3m-use-cookies t)
           (setq mm-w3m-safe-url-regexp nil)
           (setq w3m-default-display-inline-images t)
           (require 'mime-w3m)))

;; Tramp
(setq tramp-default-method "ssh")

;; Don't show external ediff frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Side by side diff is the only way
(setq ediff-split-window-function 'split-window-horizontally)

;; Easy window management
(winner-mode t) ;; turn on the global minor mode

;; For markdown mode
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))
