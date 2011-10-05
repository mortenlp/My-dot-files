;; Start gnus unplugged!
(setq gnus-plugged nil)

(setq gnus-select-method '(nntp "news.gmane.org"))

;; Makes it possible to see [Gmail] folders
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\”]\”[#’()]")

;; GMAIL stuff
(setq gnus-secondary-select-methods '((nnimap "gmail"
(nnimap-address "imap.gmail.com")
(nnimap-server-port 993)
(nnimap-stream ssl)
(imap-username "mortenlp2")
(nnir-search-engine imap))
(nntp "news.gwene.org")))
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "mortenlp2@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)

;; Posting style
(setq gnus-posting-styles `((".*"
                             (name "Morten Leander Petersen")
                             (from "Morten Leander Petersen <mortenlp2@gmail.com>")
                             (signature "/Morten"))))
(setq imap-store-password t)

;; Set group buffer layout
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(setq gnus-permanently-visible-groups ".*.*")
(setq gnus-group-line-format "%P%M%S%5y:%B%(%G%)\n")

;; Used to search gmail's
(require 'nnir)

(setq gnus-use-full-window nil)         ;Makes sure that gnus doesn't
                                        ;steel the hole frame

;; Record time stamp
(add-hook 'gnus-select-group-hook 'gnus-group-set-timestamp)

;; ?
(defun my-message-mode-setup ()
  (setq fill-column 72)
       (turn-on-auto-fill))
(add-hook 'message-mode-hook 'my-message-mode-setup)

;; Converts atom feeds to rss
(require 'mm-url)
(defadvice mm-url-insert (after DE-convert-atom-to-rss () )
  "Converts atom to RSS by calling xsltproc."
  (when (re-search-forward "xmlns=\"http://www.w3.org/.*/Atom\""
               nil t)
    (message "Converting Atom to RSS... ")
    (goto-char (point-min))
    (call-process-region (point-min) (point-max)
             "xsltproc"
             t t nil
             (expand-file-name "~/atom2rss.xsl") "-")
    (goto-char (point-min))
    (message "Converting Atom to RSS... done")))

(ad-activate 'mm-url-insert)

;; Spell checking
(add-hook 'message-mode-hook 'flyspell-mode)
