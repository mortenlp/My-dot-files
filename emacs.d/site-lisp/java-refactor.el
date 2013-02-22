(defun java-refactor-package (arg)
  "Insert a package statement at the top of the file"
  (interactive "sPackage name: ")
  (save-excursion
    (goto-char (point-min))
    (while (looking-at "^$")
      (delete-blank-lines))
    (if (looking-at "package")
        (message "Package statement already exist")
      (open-line 2)
      (insert "package " arg ";"))))

(defun java-refactor-import (arg)
  "Insert an import statement at the top of the file"
  (interactive "sImport package: ")
  (save-excursion
    (goto-char (point-min))
    (search-forward "public class" nil t)
    (if (search-backward "import" nil t)
        (progn
          (move-end-of-line nil)
          (newline 1)
          (insert "import " arg ";"))
      (goto-char (point-min))
      (if (looking-at "package")
          (progn
            (move-end-of-line nil)
            (newline 2)
            (insert "import " arg ";"))
        (open-line 2)
        (insert "import " arg ";")))))

(defvar java-refactor-mode-map (make-sparse-keymap)
  "Keymap for java-refactor-mode")

(define-minor-mode java-refactor-mode
  "Minor mode that defines some refactoring functions for java
  coding."  nil
  " Java-refactor")

;;; Keybindings
(define-key java-refactor-mode-map (kbd "C-c C-j pa") 'java-refactor-package)
(define-key java-refactor-mode-map (kbd "C-c C-j im") 'java-refactor-import)

(provide 'java-refactor)
