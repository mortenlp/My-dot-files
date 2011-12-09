;; Gnus stuff
(require 'gnus)
(setq gnus-init-file "~/Dokumenter/dotFiles/my-gnus.el")
(setq gnus-inhibit-startup-message t)

;; Mail stuff
(setq user-mail-address "mortenlp2@gmail.com")
(setq user-full-name "Morten Leander Petersen")

;; Visible bell
(setq visible-bell t)

;; Ido mode
(ido-mode t)
(setq ido-enable-flex-matching t)
(require 'smex)
(smex-initialize)

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

;; Don't disable upcase/downcase functions
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Required for emacs editing in chromium to work
(require 'edit-server)
(edit-server-start)

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

;; Folding mode
(load "folding" 'nomessage 'noerror)
(folding-add-to-marks-list 'haskell-mode "--{{{"  "--}}}"  nil t)
(folding-mode-add-find-file-hook)
(add-hook 'haskell-mode-hook 'folding-mode)
(folding-add-to-marks-list 'tuareg-mode "(*{{{"  "(*}}}*)"  nil t)
(add-hook 'tuareg-mode-hook 'folding-mode)

;; Google it!
(defun google nil
  "Google something."
  (interactive)
  (let (arg)
    (if mark-active
        (setq arg (buffer-substring (region-beginning) (region-end)))
      (setq arg (read-from-minibuffer "Search term: ")))
    (browse-url (format "http://www.google.dk/search?q=%s" arg))))

;; Paste things to ansi-term
(defun my-term-paste (&optional string)
  (interactive)
  (process-send-string
   (get-buffer-process (current-buffer))
   (if string string (current-kill 0))))

;; Tramp
(setq tramp-default-method "ssh")