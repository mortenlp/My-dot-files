(defun color-theme-morten ()
  (interactive)
  (color-theme-install
   '(color-theme-morten

     ((foreground-color . "#000000")
      (background-color . "#FFFFFF")
      (background-mode  . light)
      (border-color     . "#000000")
      (cursor-color     . "#FFFFFF")
      (mouse-color      . "sienna1"))

     (default ((t (:background "#FFFFFF" :foreground "#000000"))))
     (border-glyph ((t (nil))))

     ;;;; General
     ;; Comment
     (font-lock-comment-face ((t (:foreground "#2007FF" :italic t))))
     (font-lock-comment-delimiter-face ((t (:foreground "#2007FF"))))

     ;; Keyword
     (font-lock-keyword-face ((t (:foreground "#A52A3B" :bold t))))

     ;; User-defined constant
     (font-lock-builtin-face ((t (:foreground "#D61619" :bold t))))

     ;; Variables
     (font-lock-variable-name-face ((t (:foreground "#000000"))))

     ;; Constant
     (font-lock-constant-face ((t (:foreground "#FF06FF" :bold t))))
     (font-lock-reference-face ((t (:foreground "#7175F0"))))

     ;; Type
     (font-lock-type-face ((t (:foreground "#2E8B57"))))

     ;; String
     (font-lock-string-face ((t (:foreground "#FF00FF"))))

     ;; Preprocessor line
     (font-lock-preprocessor-face ((t (:foreground "#A720F1"))))

     ;; Function name
     (font-lock-function-name-face ((t (:foreground "#000000" :bold t))))

     ;; Documentation string
     (font-lock-doc-string-face ((t (:foreground "#B2B2B2"))))

     ;; Regexp
     (font-lock-regexp-grouping-backslash ((t (:foreground "#00BD41"))))


     ;;;; Emacs frame specific
     ;; Mode-linel
     (mode-line-inactive ((t (:background "#FFFFFF" :foreground "#000000"))))
     (mode-line ((t (:background "#000000" :foreground "#FFFFFF"))))

     ;; Selection highlight
     (highlight ((t (:background "#426BEE"  ))))
     (highline-face ((t (:background "#426BEE" ))))

     ;; Text Highlight
     (region ((t (:background "#E96D3A"))))

     ;; Cursor
     (text-cursor ((t (:background "aa0000" :foreground "black"))))

     ;; Frame
     (fringe ((t (:background "#fff"))))

     ;; Navigation
     (minibuffer-prompt ((t (:foreground "#000"))))
     (ido-subdir ((t (:foreground "#D61619" :bold t))))
     (ido-first-match ((t (:foreground "#007B22" :bold t))))
     (ido-only-match ((t (:foreground "#007B22" :bold t))))

     ;; Etc.
     (left-margin ((t (nil))))
     (toolbar ((t (nil))))
     (underline ((nil (:underline nil))))
     (gui-element ((t (:background "#aa0000" :foreground "#00aa00"))))

)))

(provide 'color-theme-morten)