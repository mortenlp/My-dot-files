;; AUCTeX
(if (locate-library "auctex")
    (progn (require 'tex-site)
           (load "preview-latex.el" nil t t))
  )


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

;; Use abbrev-mode when editing LaTeX
(add-hook 'LaTeX-mode-hook (lambda () (setq abbrev-mode t)))

(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)

;; My few LaTeX abbreviations
(define-abbrev-table 'global-abbrev-table '(
                                            ("kcol" "\\vcentcolon" nil 0)
                                            ("kmat" "\\mathbb{}" nil 0)
                                            ("kcal" "\\mathcal{}" nil 0)
                                            ))

;; Don't use ido-ubiquitous when compiling LaTeX
(ido-ubiquitous-disable-in TeX-command-master)
