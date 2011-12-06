;; Easy window management
(winner-mode t) ;; turn on the global minor mode

;; Visible bell
(setq visible-bell t)

;; Ido mode
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Don't show startup screen
(setq inhibit-startup-screen t)

;; Enable transient-mark-mode
(setq transient-mark-mode t)
(set-face-foreground 'region nil)       ;Dont highlight region!!
(set-face-background 'region nil)       ;Dont highlight region!!

;; Explicitly show the end of a buffer
(set-default 'indicate-empty-lines t)

;; No bars
(when (fboundp 'toggle-scroll-bar)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1))

;; Don’t blink the cursor
(blink-cursor-mode 0)

;; Display line and column numbers
(setq line-number-mode    t)
(setq column-number-mode  t)

;; Avoid mouse!!
(mouse-avoidance-mode 'banish)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; See matching paranthesis
(show-paren-mode t)

;; Set default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium-browser")

;; Compile command
(setq compile-command "make -f ")

;; Trailing whitespace is unnecessary
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; Enable narrowing
(put 'narrow-to-region 'disabled nil)

;; Smooth scrolling
(setq scroll-step 1 scroll-conservatively 10000)

;; Don't show scratch buffer text!
(setq initial-scratch-message nil)