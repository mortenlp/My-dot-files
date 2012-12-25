(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'mu4e)

;; default
;; (setq mu4e-maildir ("~/Maildir")

;; Set mu4e as default mail agent
(setq mail-user-agent 'mu4e-user-agent)

(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sendte e-mails")
(setq mu4e-trash-folder  "/[Gmail].Papirkurv")

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;; Try to display images in mu4e
(setq
 mu4e-view-show-images t
 mu4e-view-image-max-width 800)


(setq mu4e-confirm-quit nil
      mu4e-headers-date-format "%d/%b/%Y %H:%M" ; date format
      mu4e-html2text-command "html2text -utf8 -width 72"
      )

;; setup some handy shortcuts
;; you can quickly switch to your Inbox -- press ``ji''
;; then, when you want archive some messages, move them to
;; the 'All Mail' folder by pressing ``ma''.

(setq mu4e-maildir-shortcuts
      '( ("/INBOX"                  . ?i)
         ("/[Gmail].Sendte e-mails" . ?s)
         ("/[Gmail].Papirkurv"      . ?t)
         ("/[Gmail].All Mail"       . ?a)
         ("/[Gmail].Spam"           . ?p)
         ("/[Gmail].Drafts"         . ?d)))

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;; something about ourselves
(setq
 user-mail-address "mortenpl2@gmail.com"
 user-full-name  "Morten Leander Petersen"
 message-signature "/Morten\n")

;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu

(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-smtp-user "mortenlp2"
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)

; queue that mail
(setq smtpmail-queue-mail  nil  ;; start in non-queue mode
      smtpmail-queue-dir   "~/mail/queue/cur")

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)
