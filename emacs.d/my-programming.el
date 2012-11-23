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
          (lambda () (c-toggle-auto-newline 1)))

;; Switch between header and source file
(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

;; Compile command
(setq compile-command "make -f ")

;; For markdown mode
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))

;;; Javascript
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;; Show fill column indicator in certain modes!
(add-hook 'ruby-mode-hook 'fci-mode)
