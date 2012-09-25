;;; Gams-mode.el

(setq myKeywords
 '(("model\\|variables\\|equations\\|solve" . font-lock-function-name-face)
  )
)

(define-derived-mode gams-mode fundamental-mode
  (setq font-lock-defaults '(myKeywords))
  (setq mode-name "gams mode")
)
