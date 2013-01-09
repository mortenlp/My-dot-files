;; Set color if using X
;; (cond
;;  ((and (< emacs-major-version 24) (display-graphic-p))
;;   (load-theme 'tomorrow-night-eighties))
;;  ((and (>= emacs-major-version 24) (display-graphic-p))
;;   (load-theme 'tomorrow-night-eighties t)) )

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
