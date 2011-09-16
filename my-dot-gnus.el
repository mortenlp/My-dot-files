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
(nnir-search-engine imap))))
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
                             ("Face" "iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAACXBIWXMAAA7DAAAOwwHHb6hk
 AAAACXZwQWcAAAAwAAAAMADO7oxXAAACAUlEQVRYw81Zy4rDMAxMQr45EHouhX5r9x/2EBCzekv2
 7kbkUFxbGY31srN+Pl/LnWT7bwB1QI/zuBGgC83jPK4HR34J615d8Hy9EUcV0/P1ZquukTIgXEa/
 mS5fHufBjFFlC1VIVnpCqq6nDEgimOgxpEoi8xii2UTVRDTSmTxADAGxPZEbS+Hmr2Ejg7vGdkrV
 pjPEsGNYtTFhiBQYUt0l5DmJhhkTMyTzsoqgShIaqeYzlBWr/aCLEAcsPC3b2GQT0KUClS7RTtGL
 QyeTmNjIps6mKHAyEIYeeivl4tDbsj6E+BhbGaNJFQJVM1kcZQ4Z6OZ5IUzq2jJDiFJuQSb+/ZTT
 Z0iyhT+kSSO1b5fqfGIzRo/UvpghKzGGLtXLap0mPyQgk7r6gKz3OQSMNCoxIKk9yVBvT/vnsvB9
 YVXONmhVvdZflvP5kuoY1TnJsK/G2mYp9TnIF06cmQFXiLJ8OStlaqYz69REDBW13oE6dKxaHsJC
 5jSjVptG/YxjzMourKSLyA5/Vqer2rOrC3wVSf/Avnb52R87qwKGJh6iVe5rZ/vxA2tjYZCHMj21
 I369q5WO8d6PkZTMkHrpcI6tDZLU4m9pTt0PzRWfdRPQRDQY6kN3jBMlvGMgMW9hSxHLEqDTQoXE
 r+PfOvCOIXOj5WOaACiP+48Ymiu3+xr0Dd/32djNVNyTAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDEx
 LTA2LTI3VDEzOjE1OjE5KzAyOjAwLRFMVAAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxMS0wNi0yN1Qx
 MzoxNToxOSswMjowMFxM9OgAAAAASUVORK5CYII=")
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
