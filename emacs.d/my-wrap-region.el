;;; Wrap region
;; Active in all modes
(wrap-region-global-mode t)
;; Don't screw up key bindings in other modes
(add-to-list 'wrap-region-except-modes 'magit-status-mode)
(add-to-list 'wrap-region-except-modes 'emacs-lisp-mode)
(add-to-list 'wrap-region-except-modes 'ido-mode)
(add-to-list 'wrap-region-except-modes 'ido-ubiquitous-mode)
(wrap-region-add-wrapper "*" "*" "*" 'org-mode)
(wrap-region-add-wrapper "/" "/" "/" 'org-mode)
(wrap-region-add-wrapper "_" "_" "_" 'org-mode)
