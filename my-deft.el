;; http://jblevins.org/projects/deft/
(when (require 'deft nil 'noerror)
  (setq
   deft-extension "org"
   deft-directory "~/Dokumenter/OrgMode/deft/"
   deft-text-mode 'org-mode)
  (setq deft-auto-save-interval 20.0))