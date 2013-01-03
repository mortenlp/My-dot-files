;; Set color if using X
;; (cond
;;  ((and (< emacs-major-version 24) (display-graphic-p))
;;   (load-theme 'tomorrow-night-eighties))
;;  ((and (>= emacs-major-version 24) (display-graphic-p))
;;   (load-theme 'tomorrow-night-eighties t)) )

;;; The colors are pretty much stolen from the wombat theme
;; (custom-set-faces
;;  '(default ((t (:background "#242424" :foreground "#f6f3e8"))))
;;  '(cursor ((t (:background "gold"))))
;;  '(region ((t (:background "#555555"))))
;;  '(mode-line ((t (:foreground "#f6f3e8" :background "#444444"
;;                               :box (:line-width -1 :style released-button)))
;;               (t :inverse-video t)))
;;  ;; '(mode-line-buffer-id ((t (:foreground "f6f3e8" :weight bold))))
;;  '(mode-line-inactive ((t (:foreground "#857b6f" :background "#444444"
;;                                        :box (:line-width -1 :style released-button)))))
;;  '(hl-line ((t (:background "#333333"))))
;;  '(fringe ((t (:background "#303030"))))
;;  '(minibuffer-prompt ((t (:foreground "#e5786d"))))
;;  '(font-lock-builtin-face ((t (:foreground "#e5786d"))))
;;  '(font-lock-comment-face ((t (:foreground "#99968b"))))
;;  '(font-lock-constant-face ((t (:foreground "#e5786d" :weight bold))))
;;  '(font-lock-function-name-face ((t (:foreground "#cae682"))))
;;  '(font-lock-keyword-face ((t (:foreground "#8ac6f2" :weight bold))))
;;  '(font-lock-string-face ((t (:foreground "#95e454"))))
;;  '(font-lock-type-face ((t (:foreground "#cae682" :weight bold))))
;;  '(font-lock-variable-name-face ((t (:foreground "#cae682"))))
;;  '(font-lock-warning-face ((t (:foreground "#8f8f8f"))))
;;  '(isearch ((t (:background "yellow" :foreground "black"))))
;;  '(lazy-highlight ((t (:background "pink" :foreground "black"))))
;;  '(link ((t (:foreground "#8ac6f2" :underline t))))
;;  '(link-visited ((t (:foreground "#e5786d" :underline t))))
;;  '(button ((t (:background "#444444" :foreground "#f6f3e8" :underline t :weight bold))))
;;  '(header-line ((t (:background "#303030" :foreground "#e7f6da"))))
;;  '(org-level-2 ((t (:foreground "#e5786d")))))
;; (setq fci-rule-color "#333333")

(set-background-color "black")
(set-foreground-color "white")
(set-face-background 'region "#464740")
(set-face-background 'hl-line "#222222")
(set-face-foreground 'font-lock-warning-face "#ff6666")
(setq org-todo-keyword-faces
      '(
        ("DONE" . (:foreground "green" :weight bold))
        ))
(setq fci-rule-color "#111122")
