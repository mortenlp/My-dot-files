;;; Org-contacts
(if (locate-library "org-contacts")
    (progn
      (require 'org-contacts)
      (setq org-contacts-files (quote ("~/Dokumenter/Org/contacts.org")))))

;; Org files
(setq org-agenda-files (quote ("~/Dokumenter/Org/Notes.org")))

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
(setq org-default-notes-file (expand-file-name "~/Dokumenter/Org/Notes.org"))

;; Define templates
(setq org-capture-templates
      '(("o" "Opgave" entry (file+headline "~/Dokumenter/Org/Notes.org" "Opgaver")
         "* %? %^g\n %i\n %a\n")
        ("j" "Journal" entry (file+datetree "~/Dokumenter/Org/Journal.org")
         "* %?\nEntered on %U\n  %i\n  %a\n")
        ("ø" "JeanneØnsker" entry (file+headline "~/Dokumenter/Org/Notes.org" "Gaveidéer til Jeanne")
         "* %? %^g\n")
        ("r" "Random noter" entry (file+headline "~/Dokumenter/Org/Notes.org" "Random noter") "* %?\n")
        ("c" "Contacts" entry (file "~/Dokumenter/Org/contacts.org")
         "* %(org-contacts-template-name)
:PROPERTIES:
:EMAIL: %(org-contacts-template-email)
:END:")))

;; For moblie org
(setq org-directory "~/Dokumenter/Org")
(setq org-mobile-directory "~/Dropbox/Org-Mobile")
(setq org-mobile-inbox-for-pull "~/Dokumenter/Org/from-mobile.org")
(setq org-mobile-files '("~/Dokumenter/Org/Notes.org" "~/Dokumenter/Org/archive.org"))

;; Push changes to mobile org after saving
(add-hook 'after-save-hook (lambda ()
                             (when
                                 (or (equal buffer-file-name "/home/mortenlp/Dokumenter/Org/Notes.org")
                                     (equal buffer-file-name "/home/mortenlp/Dokumenter/Org/archive.org"))
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
