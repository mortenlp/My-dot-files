(require 'org-contacts)

;; Set file to look for contacts
(setq org-contacts-files (quote ("~/Dokumenter/OrgMode/contacts.org")))

;; Workaround to make gnus integration work
(add-hook 'message-mode-hook
          (lambda () (local-set-key (kbd "TAB") 'completion-at-point)))

;; Org files
(setq org-agenda-files (quote ("~/Dokumenter/OrgMode/Notes.org")))

;; Wrap long lines
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; Use Org-mode for .org and .org-archive
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))

;; Syntax highlighting
(global-font-lock-mode 1)

;; Define various sequences
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(d)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
        (sequence "|" "CANCELED(c)")))

;; Set drawers
(setq org-drawers (quote ("PROPERTIES" "SETUP")))

;; Set default notes file
(setq org-default-notes-file (expand-file-name "~/Dokumenter/OrgMode/Notes.org"))

;; Define templates
(setq org-capture-templates
      '(("o" "Opgave" entry (file+headline "~/Dokumenter/OrgMode/Notes.org" "Opgaver")
         "* %? %^g\n %i\n %a\n")
        ("j" "Journal" entry (file+datetree "~/Dokumenter/OrgMode/Journal.org")
         "* %?\nEntered on %U\n  %i\n  %a\n")
        ("ø" "JeanneØnsker" entry (file+headline "~/Dokumenter/OrgMode/Notes.org" "Gaveidéer til Jeanne")
         "* %? %^g\n")
        ("h" "Husk" entry (file+headline "~/Dokumenter/OrgMode/Notes.org" "Husk") "* %?\n")
        ("c" "Contacts" entry (file "~/Dokumenter/OrgMode/contacts.org")
         "* %(org-contacts-template-name)
:PROPERTIES:
:EMAIL: %(org-contacts-template-email)
:END:")))

;; For moblie org
(setq org-directory "~/Dokumenter/OrgMode")
(setq org-mobile-directory "~/Dropbox/Org-Mobile")
(setq org-mobile-inbox-for-pull "~/Dokumenter/OrgMode/from-mobile.org")