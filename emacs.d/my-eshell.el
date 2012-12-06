;; Returns the short propmpt string for eshell
(defun eshell-prompt-function-short ()
  "Makes a short eshell prompt to avoid moving out of the buffer
    window boundary"
  (let* ((pwd (eshell/pwd))
         (pwdlst (split-string pwd "/"))
         (rpwdlst (reverse pwdlst))
         (base (car rpwdlst)))
    (concat (if (string= base "")
                "/"
              (if (cdr pwdlst) "<...> /" ""))
            base
            (if (= (user-uid) 0) " # " " $ "))))
(setq eshell-prompt-function
      'eshell-prompt-function-short)
