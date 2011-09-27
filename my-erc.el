(require 'erc)

;; Log conversations
(setq erc-log-channels-directory "~/.emacs.d/logs/")
(setq erc-save-buffer-on-part nil)
(setq erc-save-queries-on-quit nil
      erc-log-write-after-send t
      erc-log-write-after-insert t)

;; Colorize when Online/Busy/Away/Idle
(setq erc-keywords '((".*Online.*" (:foreground "green"))
                     (".*Busy" (:foreground "red"))
                     (".*Away" (:foreground "red"))
                     (".*Idle" (:foreground "orange"))
                     ))

;; Ignore stuff
(setq erc-hide-list '("MODE"))
(defun erc-ignore-unimportant (msg)
  (if (or (string-match "*** localhost has changed mode for &bitlbee to" msg)
          (string-match "Account already online" msg)
          (string-match "Unknown error while loading configuration" msg))
      (setq erc-insert-this nil)))
(add-hook 'erc-insert-pre-hook 'erc-ignore-unimportant)