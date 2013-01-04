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
;; (global-set-key (kbd "M-3") 'split-window-horizontally)
;; (global-set-key (kbd "M-2") 'split-window-vertically)
;; (global-set-key (kbd "M-1") 'delete-other-windows)
;; (global-set-key (kbd "M-0") 'delete-window)
;; (global-set-key [(meta o)] 'other-window)

;; Replace dired's M-o
;; (add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map (kbd "M-o") 'other-window)))

;; Replace ibuffer's M-o
;; (add-hook 'ibuffer-mode-hook (lambda () (define-key ibuffer-mode-map (kbd "M-o") 'other-window)))

;; Easier buffer killing
;; (global-set-key [(meta k)] 'kill-this-buffer)

;; Version control and change related
(global-set-key [(control x) (m)] 'magit-status)
(global-set-key [(f7)] 'svn-status)

;; Compile
(global-set-key (kbd "C-c m") 'compile)

;; Shell/Terminal
(global-set-key [(control c) (s)] 'create-scratch-buffer)
(global-set-key (kbd "C-c <SPC>") 'ml-eshell-other-window)
(global-set-key [(control c) (y)] 'ml-term-paste)

;; Mail
(global-set-key [(f6)] 'gnus-group-mail)

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
(global-set-key (kbd "C-z 3") 'beamer-skeleton)

;; Smart TAB!
(global-set-key (kbd "C-.") 'hippie-expand)

;; Rotate windows
(global-set-key [(control c) (r)] 'rotate-windows)

;; Eval-and-replace-ish kbd macro
(global-set-key [(control c) (e)] 'eval-and-replace)

;; Tell-the-time
(global-set-key [(control c) (u)] 'ml-tell-the-time)

;; Browse url
(global-set-key (kbd "C-c b") 'browse-url)

;; Expand region
(global-set-key (kbd "C-æ") 'er/expand-region)

;; Evil-numbers
(global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)

;; Screencast
(global-set-key (kbd "C-z s a") 'screencast-start)
(global-set-key (kbd "C-z s e") 'screencast-stop)

;; Ace-jump-mode
(define-key global-map (kbd "C-ø") 'ace-jump-mode)

;; Find library
(global-set-key (kbd "C-c f") 'find-library)

;; View url-at-point
(global-set-key (kbd "C-c v") 'eval-buffer)

;; Experimental multiple-cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-'") 'mc/mark-all-like-this-dwim)

;;; SAS bindings
(define-key ess-mode-map (kbd "C-c C-u") 'ml-submit-portion-sas)
(define-key ess-mode-map (kbd "C-z C-m") 'ml-mark-proc)

;;; Gnus
(global-set-key (kbd "C-c n") 'gnus)

;;; Find-file-in-project
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)

(global-set-key (kbd "C-c w") 'winner-undo)

;; Use shell-like backspace C-h, rebind help to F1
(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(add-hook 'c-mode-common-hook
          '(lambda () (local-set-key (kbd "C-M-h") 'backward-kill-word)))

;;; Alternative M-x
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

;;; H-space
(global-set-key (kbd "C-,") 'ml-h-space)

;; Jump from file to containing directory
(global-set-key (kbd "C-x C-j") 'dired-jump) (autoload 'dired-jump "dired")
(global-set-key (kbd "C-x M-j") '(lambda () (interactive) (dired-jump 1)))

;; Browse the kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)
