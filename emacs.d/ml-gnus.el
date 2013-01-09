;; Start gnus plugged!
(setq gnus-plugged t)

;;; Textify html
(setq mm-discouraged-alternatives '("text/html" "text/richtext"))

(setq gnus-select-method '(nntp "news.gmane.org"))

;; Makes it possible to see [Gmail] folders
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\”]\”[#’()]")

(setq gnus-directory "~/.emacs.d/news"
      gnus-kill-files-directory "~/.emacs.d/news"
      gnus-home-directory "~/.emacs.d"
      gnus-dribble-directory "~/.emacs.d"
      gnus-always-read-dribble-file t

      mail-source-directory "~/.emacs.d/mail"
      message-directory "~/.emacs.d/mail"

      message-kill-buffer-on-exit t
      gnus-treat-display-smileys nil
      gnus-message-archive-group "sent"
      gnus-fetch-old-headers 'some
      nnmail-crosspost nil
      mail-source-delete-incoming nil
      gnus-asynchronous t
      gnus-agent-expire-days 0
      gnus-agent-synchronize-flags t
      gnus-agent-enable-expiration 'DISABLE)


;; GMAIL stuff
(add-to-list 'gnus-secondary-select-methods
             '(nntp "news.gwene.org"))
(add-to-list 'gnus-secondary-select-methods
             '(nnimap "gmail"
                      (nnimap-address "imap.gmail.com")
                      (nnimap-user "mortenlp2")
                      (nnimap-server-port 993)
                      (nnimap-stream ssl)
                      (nnir-search-engine imap)))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-smtp-user "mortenlp2"
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

;; Allow sending of messages of unlimited size
(setq message-send-mail-partially-limit nil)

;; Used to search gmail's
(require 'nnir)

(setq gnus-use-full-window t)         ;Makes sure that gnus doesn't
                                        ;steel the hole frame

;; Record time stamp
(add-hook 'gnus-select-group-hook 'gnus-group-set-timestamp)

;; ?
(defun ml-message-mode-setup ()
  (setq fill-column 80)
  (turn-on-auto-fill))
(add-hook 'message-mode-hook 'ml-message-mode-setup)

;; Spell checking
;; (add-hook 'message-mode-hook 'flyspell-mode)

;; Fix ugly errors when unplugged!
(add-hook 'gnus-agent-unplugged-hook
          #'(lambda ()
              (setq nntp-marks-file-name ".marks")))

;; Unbind this key; it's annoying!
(define-key gnus-summary-mode-map "o" (lambda () (interactive)))

(setq gnus-interactive-exit nil)

;;; Restore window configuration when done reading news
(defadvice gnus (around gnus-fullscreen activate)
  (window-configuration-to-register :gnus-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun gnus-quit-session ()
  "Restores the previous window configuration and kills the gnus group buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :gnus-fullscreen))

(define-key gnus-group-mode-map (kbd "q") 'gnus-quit-session)

;;; Don't ask if it is ok to go online
(setq gnus-agent-go-online t)
