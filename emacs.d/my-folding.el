;; Folding mode
(load "folding" 'nomessage 'noerror)
(folding-add-to-marks-list 'haskell-mode "--{{{"  "--}}}"  nil t)
(folding-mode-add-find-file-hook)
(add-hook 'haskell-mode-hook 'folding-mode)
(folding-add-to-marks-list 'tuareg-mode "(*{{{"  "(*}}}*)"  nil t)
(add-hook 'tuareg-mode-hook 'folding-mode)

(provide 'my-folding)
