;;; Global key bindigns

;; How to Define Keyboard Shortcuts in Emacs
;; http://xahlee.org/emacs/keyboard_shortcuts.html

;; Window manipulation
(global-set-key [(control kp-6)] 'enlarge-window-horizontally)
(global-set-key [(control kp-4)] 'shrink-window-horizontally)
(global-set-key [(control kp-8)] 'enlarge-window)
(global-set-key [(control kp-2)] 'shrink-window)
(global-set-key [(control kp-5)] 'balance-windows)

;; Easier window movements
(global-set-key (kbd "M-æ") 'windmove-left)          ; move to lefter window

;; Refresh-like
(global-set-key [(f5)]  'revert-buffer)

;; Indenting and alignment
(global-set-key [(f8)]         'indent-region)
(global-set-key [(control f8)] 'align)
(global-set-key [(shift f8)]   'align-current)
(global-set-key [(meta f8)]    'align-regexp)

;; Map the window manipulation keys to meta 0, 1, 2, o
(global-set-key (kbd "M-3") 'split-window-horizontally) ; was digit-argument
(global-set-key (kbd "M-2") 'split-window-vertically) ; was digit-argument
(global-set-key (kbd "M-1") 'delete-other-windows) ; was digit-argument
(global-set-key (kbd "M-0") 'delete-window) ; was digit-argument
(global-set-key (kbd "M-o") 'other-window) ; was facemenu-keymap
;; Replace dired's M-o
(add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map (kbd "M-o") 'other-window))) ; was dired-omit-mode
;; Replace ibuffer's M-o
(add-hook 'ibuffer-mode-hook (lambda () (define-key ibuffer-mode-map (kbd "M-o") 'other-window))) ; was ibuffer-visit-buffer-1-window

;; Version control and change related
(global-set-key [(f7)]    'svn-status)
(global-set-key [(f6)]    'magit-status)

;; Compile
(global-set-key [(f9)]  'compile)

;; Open Shell
(global-set-key "\C-cs" 'shell)

;; Open ansi-term
(global-set-key "\C-ct" 'ansi-term)

;; Repeat
(global-set-key [(control z)] 'repeat) ; was suspend-frame

;; Find matching parens
(global-set-key (kbd "C-'") 'match-paren)

;; Easier buffer killing
(global-set-key (kbd "M-k") 'kill-this-buffer)

;; Mail
(global-set-key (kbd "C-x m") 'gnus-group-mail)

;; Imenu (nice!)
(global-set-key [(control x) (control i)] 'imenu)