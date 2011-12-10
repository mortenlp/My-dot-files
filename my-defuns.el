;; full screen toggle using F11
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                         'fullboth)))

;; Google it!
(defun google nil
  "Google something."
  (interactive)
  (let (arg)
    (if mark-active
        (setq arg (buffer-substring (region-beginning) (region-end)))
      (setq arg (read-from-minibuffer "Search term: ")))
    (browse-url (format "http://www.google.dk/search?q=%s" arg))))

;; Paste things to ansi-term
(defun my-term-paste (&optional string)
  (interactive)
  (process-send-string
   (get-buffer-process (current-buffer))
   (if string string (current-kill 0))))

;; Eval-and-replace-ish kbd macro
(fset 'eval-and-replace
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([21 24 5 134217826 escape C-backspace 134217830] 0 "%d")) arg)))