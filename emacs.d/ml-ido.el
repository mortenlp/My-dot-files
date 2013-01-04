;; Ido mode
(ido-mode t)
(setq ido-enable-flex-matching t)
(smex-initialize)

;; Use ido everywhere
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; Fix ido-ubiquitous for newer packages
(defmacro ido-ubiquitous-use-new-completing-read (cmd package)
  `(eval-after-load ,package
     '(defadvice ,cmd (around ido-ubiquitous-new activate)
        (let ((ido-ubiquitous-enable-compatibility nil))
          ad-do-it))))

(ido-ubiquitous-use-new-completing-read webjump 'webjump)
(ido-ubiquitous-use-new-completing-read yas/expand 'yasnippet)
(ido-ubiquitous-use-new-completing-read yas/visit-snippet-file 'yasnippet)

;;; Disable ido-ubiquitous in certain situations
(ido-ubiquitous-disable-in mml-attach-file)
(ido-ubiquitous-disable-in TeX-command-master)
(ido-ubiquitous-disable-in org-capture)
