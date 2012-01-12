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

;; Rotate windows easily
(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

(defun tell-the-time ()
  "Print the time and date in the minibuffer"
  (interactive)
  (shell-command "date")
  )