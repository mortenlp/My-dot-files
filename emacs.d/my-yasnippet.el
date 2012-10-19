;;; Snippets make typing fun

(require 'dropdown-list)

;; (yas/global-mode 1)
(add-hook 'c-mode-common-hook 'yas/minor-mode)
(add-hook 'emacs-lisp-mode-hook 'yas/minor-mode)
(add-hook 'html-mode-hook 'yas/minor-mode)
(add-hook 'python-mode-hook 'yas/minor-mode)
(add-hook 'ess-mode-hook 'yas/minor-mode)
(add-hook 'nxml-mode-hook 'yas/minor-mode)

(yas/load-directory
 (car (file-expand-wildcards "~/.emacs.d/elpa/yasnippet-*/snippets")))
(yas/load-directory "~/.emacs.d/snippets/")

(setq yas/prompt-functions '(yas/ido-prompt
                             yas/dropdown-prompt
                             yas/completing-prompt))

;; ;; Replace yasnippets's TAB
;; (add-hook 'yas/minor-mode-hook
;;           (lambda () (define-key yas/minor-mode-map
;;                        (kbd "TAB") 'smart-tab))) ; was yas/expand
