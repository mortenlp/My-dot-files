;; AUCTeX
(if (locate-library "auctex")
    (require 'tex-site))
(load "preview-latex.el" nil t t)

;; RefTeX and Mathmode
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(setq reftex-label-alist '((nil ?e nil "~\\eqref{%s}" nil nil)))
(setq reftex-plug-into-AUCTeX t)

;; Turn on flyspell
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

;; PDF mode
(setq TeX-PDF-mode t)

;;autosave before compiling
(setq TeX-save-query nil)
