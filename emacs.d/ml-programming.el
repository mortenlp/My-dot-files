;; Set up par-edit
(autoload 'paredit-mode "paredit"
      "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))

;; Don't use tabs when indenting!!
(setq-default indent-tabs-mode nil)

;; Auto-new-line
(add-hook 'c-mode-common-hook
          (lambda () (c-toggle-auto-newline -1)))

;; Switch between header and source file
(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

;; Compile command
(setq compile-command "make -k -f ")

;; For markdown mode
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))
(add-hook 'markdown-mode-hook 'turn-on-auto-fill)

;;; Javascript
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;; Show fill column indicator in certain modes!
(add-hook 'ruby-mode-hook 'fci-mode)
(add-hook 'c-mode-common-hook 'fci-mode)
(add-hook 'emacs-lisp-mode-hook 'fci-mode)
(add-hook 'LaTeX-mode-hook 'fci-mode)
(add-hook 'sh-mode-hook 'fci-mode)

;;; JAVA
(add-hook 'java-mode-hook (lambda ()
                            (local-set-key
                             (kbd "M-j")
                             '(lambda () (interactive) (join-line -1)))))
(add-hook 'java-mode-hook 'java-refactor-mode)
(diminish 'java-refactor-mode)
