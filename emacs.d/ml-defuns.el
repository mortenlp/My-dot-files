(defun ml-goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number
input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (call-interactively 'goto-line))
    (linum-mode -1)))

(defun ml-eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun ml-sudo-edit (&optional arg)
  (interactive)
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:"
                                 buffer-file-name))))

(defun delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

;;; Create new scratch buffer
(defun create-scratch-buffer nil
  "create a new scratch buffer to work in. (could be *scratch* - *scratchX*)"
  (interactive)
  (let ((n 0)
        bufname)
    (while (progn
             (setq bufname (concat "*scratch"
                                   (if (= n 0) "" (int-to-string n))
                                   "*"))
             (setq n (1+ n))
             (get-buffer bufname)))
    (switch-to-buffer (get-buffer-create bufname))
    (emacs-lisp-mode)
    ))

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
(defun ml-term-paste (&optional string)
  (interactive)
  (process-send-string
   (get-buffer-process (current-buffer))
   (if string string (current-kill 0))))

;; Eval-and-replace-ish kbd macro
(fset 'eval-and-replace
   (lambda (&optional arg) "Keyboard macro." (interactive "p")
     (kmacro-exec-ring-item
      (quote ([21 24 5 134217826 escape C-backspace 134217830] 0 "%d")) arg)))

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

(defun ml-tell-the-time ()
  "Print the time and date in the minibuffer"
  (interactive)
  (shell-command "date"))

(defun ml-show-battery-state ()
  "Print the battery state in the minibuffer"
  (interactive)
  (shell-command "acpi"))

(defun ml-pub-web ()
  "Export my index.org to html and copy to public_html"
  (interactive)
  (org-export-as-html 3)
  (setq scp-string (concat "scp ~/Dokumenter/Homepage/index.html"
                           " ~/Dokumenter/Homepage/org.css"
                           " ~/Dokumenter/Homepage/index.org"
                           " mortenlp@ssh1.imf.au.dk:/home/mortenlp/public_html/"))
  (shell-command scp-string))

(defun ml-etags-current (sudo string)
  "Run the etags shell command on the current directory.
STRING should be one of the following:
c/cpp -> for c/c++ programs
el -> for elisp"
  (interactive (list (y-or-n-p "As root? ")
                     (completing-read
                      "Choose language: " '("c/cpp" "el") nil t)))
  (let ((command "find . -regex "))
    (if (eq sudo t)
        (setq command (concat "sudo " command)))
    (cond
     ((equal string "c/cpp")
      (setq command (concat command "'.*\.c\|.*\.h\|.*\.cpp' -print | etags -")))
     ((equal string "el")
      (setq command (concat command "'.*\.el\|.*\.el.gz' -print | etags -"))))
    (if (eq sudo t)
        (eshell-command command)
      (shell-command command))))


;;; Function to mark a proc or data step in SAS code
(defun ml-mark-proc ()
  "Mark the proc or data step at point"
  (interactive)
  (set-mark (point))
  (re-search-forward "\\(run;\\)\\|\\(quit;\\)")
  (set-mark (point))
  (re-search-backward "\\(^ *proc\\)\\|\\(^ *data[^=l]\\)"))

;;; Function to run the sas code contained in the region
(defun ml-submit-portion-sas (beg end)
  "Create a new temporary file to store the current region and run a batch process of SAS on that temporary file"
  (interactive (list (point) (mark)))
  (unless (and beg end)
    (error "The mark is not set now, so there is no region"))
  (save-excursion
    (kill-ring-save beg end)
    (find-file "temp.sas")
    (yank)
    (save-buffer)
    (kill-this-buffer)
    (shell-command "sas.exe temp.sas")
    (shell-command "rm temp.sas")))

;;; Toggle notetaking buffer
(defun ml-toggle-notetaking-buffer ()
  "Open a buffer in a seperate window that is designed to take notes."
  (interactive)
  (switch-to-buffer-other-window (get-buffer-create "*Notes*")))

;;; Horizontal space
(defun ml-h-space ()
  (interactive)
  (save-excursion
    (insert-char ?\s 1)))

(defun ml-choose-shell (n)
    (let* ((shell-name (concat "*shell-" (number-to-string n) "*"))
	  (buf (get-buffer shell-name)))
      (if (null buf)
	  (progn
	    (setq buf (eshell))
	    (rename-buffer shell-name)))
      (pop-to-buffer buf)
      (goto-char (point-max))))

(defun ml-shell (n)
  (interactive "P")
  (cond ((null n) (ml-choose-shell 0))		; no prefix
	((atom n) (ml-choose-shell n))		; numeric prefix
	(t (ml-choose-shell 1)) ))		; ^U prefix
