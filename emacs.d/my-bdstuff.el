;;; ----------------------------DEFUNS--------------------------------------

;;; Insert a comment box!
(defun mrp/c-box (comment)
  "Inserts a comment box at point"
  (interactive "sEnter a comment: ")
  (let ((star-string "/******************************************************************************/"))
    (insert star-string "\n" (upcase comment))
    (center-line)
    (move-beginning-of-line nil)
    (insert "/*")
    (delete-char 2)
    (move-end-of-line nil)
    (while (< (current-column) 78)
      (insert " "))
    (insert "*/" "\n" star-string "\n" "\n"))
  )

(defun mrp/comment-line ()
  "On the current line insert '/* */' arround it."
  (interactive)
  (save-excursion (move-end-of-line nil)
                  (delete-trailing-whitespace)
                  (backward-char 2)
                  (if (not (looking-at "*"))
                      (progn
                        (move-end-of-line nil)
                        (while (< (current-column) 78)
                          (insert " "))
                        (insert "*/"))
                    (while (< (current-column) 78)
                      (insert " ")))
                  (move-beginning-of-line nil)
                  (if (not (looking-at "/"))
                      (progn (insert "/*")
                             (delete-char 2)))))


(defun mrp/tell-the-time ()
  "Print the time and date in the minibuffer"
  (interactive)
  (if display-time-mode
      (display-time-mode 0)
    (display-time-mode 1)))

(defun file-name-with-one-directory (file-name)
  (concat (cadr (reverse (split-string file-name "/"))) "/"
          (file-name-nondirectory file-name)))

(defun recentf--file-cons (file-name)
  (cons (file-name-with-one-directory file-name) file-name))

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let* ((recent-files (mapcar 'recentf--file-cons recentf-list))
         (files (mapcar 'car recent-files))
         (file (completing-read "Choose recent file: " files)))
    (find-file (cdr (assoc file recent-files)))))

(defun mrp/sas-indent ()
  "Indent stuff"
  (interactive)
  (save-excursion (re-search-backward "\\(^[ \t]*proc\\)\\|\\(^[ \t]*data[^=ls]\\)")
                  (move-end-of-line nil)
                  (forward-char 1)
                  (while (not (looking-at "\\(^[ \t]*run;\\)\\|\\(^[ \t]*quit;\\)"))
                    (ess-sas-tab-to-tab-stop)
                    (move-end-of-line nil)
                    (forward-char 1))))

(defun mrp/add-change-mho ()
  "Add new change to changelog"
  (interactive)
  (let ((startpos (point))
        (logstring "ændringslog:\\|changelog:\\|changes:"))
    (goto-char (point-min))
    (if (re-search-forward logstring nil t)
        (progn (search-forward "*************/" nil t)
               (move-beginning-of-line nil)
               (backward-char 1)
               (newline-and-indent)
               (insert "/* MRP    | ")
               (insert-date)
               (insert " | ")
               (save-excursion
                 (insert "  */")))
      (message "No changelog in this document!")
      (goto-char startpos))))

(defun mrp/add-change-djursland ()
  "Add new change to changelog"
  (interactive)
  (let ((startpos (point))
        (logstring "ændringslog:\\|changelog:\\|changes:"))
    (goto-char (point-min))
    (if (re-search-forward logstring (point-max) t)
        (progn (move-end-of-line nil)
               (newline-and-indent)
               (insert "/* ")
               (insert-date)
               (insert ": ")
               (save-excursion
                 (insert "  */")))
      (message "No changelog in this document!")
      (goto-char startpos))))

(defun mrp/add-test-djursland ()
  "Add new test to testcases"
  (interactive)
  (let ((startpos (point))
        (logstring "testcases:\\|testcase:"))
    (goto-char (point-min))
    (if (re-search-forward logstring (point-max) t)
        (progn (move-end-of-line nil)
               (newline-and-indent)
               (insert "/* ")
               (insert-date)
               (insert ": ")
               (save-excursion
                 (insert "  */")))
      (message "No testcases in this document!")
      (goto-char startpos))))

(defun mrp/toggle-work-mrpwork ()
  "Replace, in current buffer, all occurences of 'work' with 'mrpwork' or vice verca"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (if (search-forward "mrpwork" nil t)
        (progn
          (goto-char (point-min))
          (replace-string "mrpwork" "work"))
      (goto-char (point-min))
      (replace-string "work" "mrpwork"))))

;;; -----------------------------SETTINGS------------------------------------------

;;; Display 24h time
(setq display-time-24hr-format t)

;;; Insert date format
(setq insert-date-format "%Y-%m-%d")

;;; Grep'ish in Windows
(setq grep-command "findstr /i ")
(setq grep-find-command "find . -iname ")

;;; SAS
(eval-after-load "ess-mode" '(require 'sas-mode-expansions))
(setq sas-indent-width 0)
(define-key ess-mode-map [(shift tab)] 'ess-sas-tab-to-tab-stop)
(add-hook 'ess-mode-hook 'sas-extras-mode)

;; Auto refresh buffers
(global-auto-revert-mode 1)
;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(add-to-list 'auto-mode-alist '("\\.\\(log\\)$" . sas-log-mode))
(add-to-list 'auto-mode-alist '("\\.\\(lst\\)$" . sas-listing-mode))

(setq sas-extras-test-file "u:/My Documents/My SAS Files/9.2/test_env/test.sas")

;;; Frokostmakro!
(fset 'frokost
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([124 134217830 11 11 32 124 32 5 124 10 124 45 tab 1 11 11] 0 "%d")) arg)))

;; Wrap around region in Yasnippet
(setq yas/wrap-around-region t)

;;; Remove clutter from modeline
(diminish 'sas-extras-mode)
(diminish 'yas-minor-mode)

;; Save a list of recent files visited. (open recent file with C-x f)
(recentf-mode 1)
(setq recentf-max-saved-items 100) ;; just 20 is too recent

;; Don't break lines for me, please
(setq-default truncate-lines t)

;;; Use fill column indicator in certain modes
(add-hook 'ess-mode-hook 'fci-mode)
(add-hook 'emacs-lisp-mode-hook 'fci-mode)

;;; Change the indicator color when using the tomorrow-night-eighties theme
(when (equal (background-color-at-point) "#2d2d2d")
  (setq fci-rule-color "#222222"))

;;; ----------------------------SKELETONS-----------------------------------------------

(define-skeleton org-export-template
  "\n"
  "\n"
  "#+TITLE:\n"
  "#+AUTHOR:    Morten Leander Petersen\n"
  "#+EMAIL:     mrp@bankdata.dk\n"
  "#+LANGUAGE:  en\n"
  "#+OPTIONS:   H:3 num:nil toc:nil \\n:nil @:t ::t |:t ^:t -:t f:t *:t <:t timestamp:nil\n"
  "#+OPTIONS:   TeX:t LaTeX:t skip:nil d:nil todo:t pri:nil tags:not-in-toc author:nil\n"
  )

(global-set-key (kbd "C-z 4") 'org-export-template)

(setq text-scale-mode-step 1.1)

(when window-system
  (setq frame-title-format " %F"))

;;; ----------------------------BINDINGS-------------------------------------------------

;;; Comment stuff
(global-set-key (kbd "C-z b") 'mrp/c-box)
(global-set-key (kbd "C-z l") 'mrp/comment-line)
(global-set-key (kbd "C-z a") 'mrp/adjust-box)

(global-set-key (kbd "C-c u") 'mrp/tell-the-time)

;;; SAS
(define-key ess-mode-map (kbd "C-M-h") 'backward-kill-word)

;;; Frokost!
(global-set-key (kbd "C-c k") 'frokost)

;;; Find recent files
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)

;;; SAS bindings
(add-hook 'ess-mode-hook '(lambda () (local-set-key (kbd "C-c C-o C-t")
                                                    'mrp/sas-indent)))
(add-hook 'ess-mode-hook '(lambda () (local-set-key (kbd "C-c C-o c")
                                                    'mrp/add-change-mho)))
(add-hook 'ess-mode-hook '(lambda () (local-set-key (kbd "C-c C-o t")
                                                    'mrp/add-test-djursland)))
(add-hook 'ess-mode-hook '(lambda () (local-set-key (kbd "C-c C-o w")
                                                    'mrp/toggle-work-mrpwork)))

;;; Make sure that mrp/h-space also works in orgmode
(add-hook 'org-mode-hook '(lambda () (local-set-key (kbd "C-,")
                                                    'mrp/h-space)))

;; Jump from file to containing directory
(global-set-key (kbd "C-x C-j") 'dired-jump) (autoload 'dired-jump "dired")
(global-set-key (kbd "C-x M-j") '(lambda () (interactive) (dired-jump 1)))

;; Browse the kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)
