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

;; Makes synctex work!!!
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(setq TeX-source-correlate-start-server t)
(require 'dbus)
(defun th-evince-sync (file linecol)
   (let ((buf (get-buffer file))
         (line (car linecol))
         (col (cadr linecol)))
     (if (null buf)
         (message "Sorry, %s is not opened..." file)
       (switch-to-buffer buf)
       (goto-line (car linecol))
       (unless (= col -1)
         (move-to-column col)))))

(when (and
       (eq window-system 'x)
       (fboundp 'dbus-register-signal))
  (dbus-register-signal
   :session nil "/org/gnome/evince/Window/0"
   "org.gnome.evince.Window" "SyncSource"
   'th-evince-sync))

;; Use abbrev-mode when editing LaTeX
(add-hook 'LaTeX-mode-hook (lambda () (setq abbrev-mode t)))

;; My few LaTeX abbreviations
(define-abbrev-table 'global-abbrev-table '(
                                            ("kcol" "\\vcentcolon" nil 0)
                                            ("kmat" "\\mathbb{}" nil 0)
                                            ("kcal" "\\mathcal{}" nil 0)
                                            ))

;; Don't use ido-ubiquitous when compiling LaTeX
(ido-ubiquitous-disable-in TeX-command-master)
