;;; Org-contacts
(if (locate-library "org-contacts")
    (progn
      (require 'org-contacts)
      (setq org-contacts-files (quote ("~/Dokumenter/OrgMode/contacts.org")))))

;; Org files
(setq org-agenda-files (quote ("~/Dokumenter/OrgMode/Notes.org")))

;; Wrap long lines
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;;; Use org in other modes as well!
(add-hook 'message-mode-hook 'turn-on-orgstruct++)

;; Use Org-mode for .org and .org-archive
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))

;; Syntax highlighting
(global-font-lock-mode 1)

(setq org-archive-location "archive.org::* Færdiggjorte opgaver")

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
        ("r" "Random noter" entry (file+headline "~/Dokumenter/OrgMode/Notes.org" "Random noter") "* %?\n")
        ("c" "Contacts" entry (file "~/Dokumenter/OrgMode/contacts.org")
         "* %(org-contacts-template-name)
:PROPERTIES:
:EMAIL: %(org-contacts-template-email)
:END:")))

;; For moblie org
(setq org-directory "~/Dokumenter/OrgMode")
(setq org-mobile-directory "~/Dropbox/Org-Mobile")
(setq org-mobile-inbox-for-pull "~/Dokumenter/OrgMode/from-mobile.org")
(setq org-mobile-files '("~/Dokumenter/OrgMode/Notes.org" "~/Dokumenter/OrgMode/archive.org"))

;; Push changes to mobile org after saving
(add-hook 'after-save-hook (lambda ()
                             (when
                                 (or (equal buffer-file-name "/home/mortenlp/Dokumenter/OrgMode/Notes.org")
                                     (equal buffer-file-name "/home/mortenlp/Dokumenter/OrgMode/archive.org"))
                               (org-mobile-push))))

;; Add languages to org-babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (R . t)
   (C . t)
   (latex . t)))

;; Show syntax highlighted fonts when using org-babel.
(setq org-src-fontify-natively t)

;;; Don't clutter the agenda
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
