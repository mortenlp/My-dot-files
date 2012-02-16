;; Make Control-z a key prefix.
(global-unset-key [(control z)])
(global-set-key [(control z)] (make-sparse-keymap))

;; Window manipulation
(global-set-key [(control kp-6)] 'enlarge-window-horizontally)
(global-set-key [(control kp-4)] 'shrink-window-horizontally)
(global-set-key [(control kp-8)] 'enlarge-window)
(global-set-key [(control kp-2)] 'shrink-window)
(global-set-key [(control kp-5)] 'balance-windows)

;; Refresh-like
(global-set-key [(f5)]  'revert-buffer)

;; Map the window manipulation keys to meta 0, 1, 2, o
(global-set-key (kbd "M-3") 'split-window-horizontally)
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key [(meta o)] 'other-window)

;; Replace dired's M-o
(add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map (kbd "M-o") 'other-window)))

;; Replace ibuffer's M-o
(add-hook 'ibuffer-mode-hook (lambda () (define-key ibuffer-mode-map (kbd "M-o") 'other-window)))

;; Easier buffer killing
(global-set-key [(meta k)] 'kill-this-buffer)

;; Version control and change related
(global-set-key [(f6)] 'magit-status)
(global-set-key [(f7)] 'svn-status)

;; Compile
(global-set-key [(f9)]  'compile)

;; Shell/Terminal
(global-set-key [(control c) (s)] 'eshell)
(global-set-key [(control c) (t)] 'ansi-term)
(global-set-key [(control c) (y)] 'my-term-paste)

;; Mail
(global-set-key [(control x) (m)] 'gnus-group-mail)

;; Imenu (nice!)
(global-set-key [(control x) (control i)] 'imenu)

;; Smex
(global-set-key [(meta x)] 'smex)
(global-set-key [(meta X)] 'smex-major-mode-commands)

;; Fullscreen
(global-set-key [(f11)] 'toggle-fullscreen)

;; Google
(global-set-key [(control c) (g)] 'google)

;; Deft
(global-set-key [(control c) (d)] 'deft)

;; Orgmode
(global-set-key [(control c) (l)] 'org-store-link)
(global-set-key [(control c) (a)] 'org-agenda)
(global-set-key [(control c) (c)] 'org-capture)

;; Skeletons
(global-set-key (kbd "C-z 1") 'latex-skeleton)
(global-set-key (kbd "C-z 2") 'java-skeleton)

;; Smart TAB!
(global-set-key (kbd "TAB") 'smart-tab)

;; Rotate windows
(global-set-key [(control c) (r)] 'rotate-windows)

;; Eval-and-replace-ish kbd macro
(global-set-key [(control c) (e)] 'eval-and-replace)

;; Tell-the-time
(global-set-key [(control c) (u)] 'tell-the-time)

;; Display the battery state
(global-set-key [(control c) (b)] 'show-battery-state)

(global-set-key (kbd "C-æ") 'er/expand-region)
