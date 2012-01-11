;;; Snippets make typing fun

(require 'dropdown-list)

(yas/global-mode 1)

;; Disable yasnippet in certain modes
(add-hook
 'magit-mode-hook
 (lambda ()
   (setq yas/dont-activate t)
   ))

(add-hook
 'message-mode-hook
 (lambda ()
   (setq yas/dont-activate t)
   ))

(add-hook
 'gnus-article-mode-hook
 (lambda ()
   (setq yas/dont-activate t)
   ))

(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")
(yas/load-directory "~/.emacs.d/snippets/")

(setq yas/prompt-functions '(yas/ido-prompt
                             yas/dropdown-prompt
                             yas/completing-prompt))

;; Replace yasnippets's TAB
(add-hook 'yas/minor-mode-hook
          (lambda () (define-key yas/minor-mode-map
                       (kbd "TAB") 'smart-tab))) ; was yas/expand

