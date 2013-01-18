;; Tooltip mode off
(tooltip-mode -1)

;; Visible bell
(setq visible-bell t)

;; Don't show startup screen
(setq inhibit-startup-screen t)

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


;; Set color if using X
(cond
 ((and (< emacs-major-version 24) (display-graphic-p))
  (load-theme 'naquadah))
 ((and (>= emacs-major-version 24) (display-graphic-p))
  (load-theme 'naquadah t)) )
(setq fci-rule-color "#222222")

;; (set-background-color "black")
;; (set-foreground-color "white")
;; (set-face-background 'region "#464740")
;; (set-face-background 'hl-line "#222222")
;; (set-face-foreground 'font-lock-warning-face "#ff6666")
;; (setq org-todo-keyword-faces
;;       '(
;;         ("DONE" . (:foreground "green" :weight bold))
;;         ))
;; (setq fci-rule-color "#111122")
