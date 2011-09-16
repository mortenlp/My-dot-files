;;-*-coding: emacs-mule;-*-
(define-abbrev-table 'Buffer-menu-mode-abbrev-table '())

(define-abbrev-table 'awk-mode-abbrev-table '())

(define-abbrev-table 'browse-kill-ring-edit-mode-abbrev-table '())

(define-abbrev-table 'browse-kill-ring-mode-abbrev-table '())

(define-abbrev-table 'c++-mode-abbrev-table '())

(define-abbrev-table 'c-mode-abbrev-table '())

(define-abbrev-table 'calendar-mode-abbrev-table '())

(define-abbrev-table 'change-log-mode-abbrev-table '())

(define-abbrev-table 'comint-mode-abbrev-table '())

(define-abbrev-table 'completion-list-mode-abbrev-table '())

(define-abbrev-table 'diary-fancy-display-mode-abbrev-table '())

(define-abbrev-table 'diary-mode-abbrev-table '())

(define-abbrev-table 'diff-mode-abbrev-table '())

(define-abbrev-table 'dig-mode-abbrev-table '())

(define-abbrev-table 'docTeX-mode-abbrev-table '())

(define-abbrev-table 'doctex-mode-abbrev-table '())

(define-abbrev-table 'emacs-lisp-mode-abbrev-table '())

(define-abbrev-table 'fundamental-mode-abbrev-table '())

(define-abbrev-table 'global-abbrev-table
  '(
    (".alt" "alternative" nil 0)
    ("k0" "find . -type f -empty" nil 0)
    ("k00" "find . -type f -size 0 -exec rm {} ';'" nil 0)
    ("kahk" "AutoHotkey" nil 0)
    ("kalt" "alternative" nil 0)
    ("kbg" "background" nil 0)
    ("kcal" "\\mathcal{}" nil 4)
    ("kchar" "character" nil 0)
    ("kchmod" "find . -type f -exec chmod 644 {} ';'" nil 0)
    ("kchmod2" "find . -type d -exec chmod 755 {} ';'" nil 0)
    ("kcol" "\\vcentcolon" nil 1)
    ("kcp" "computer" nil 0)
    ("kcs" "Chthonic Syndicate" nil 0)
    ("kcurly" "‘¡°\\([^‘¡±]+?\\)‘¡±" nil 0)
    ("kdef" "definition" nil 0)
    ("kditto" "ditto -ck --sequesterRsrc --keepParent src dest" nil 0)
    ("kee" "ErgoEmacs" nil 0)
    ("kenv" "environment" nil 0)
    ("kev" "environment variable" nil 0)
    ("kex" "example" nil 0)
    ("kff" "FireFox" nil 0)
    ("kg" "Google" nil 0)
    ("kge" "Google Earth" nil 0)
    ("kie" "Internet Explorer" nil 0)
    ("kim" "convert -quality 85% " nil 0)
    ("kim256" "convert +dither -colors 256 " nil 0)
    ("kimf" "find . -name \"*png\" | xargs -l -i basename \"{}\" \".png
\" | xargs -l -i  convert -quality 85% \"{}.png\" \"{}.jpg\"" nil 0)
    ("kims" "convert -size  -quality 85% " nil 0)
    ("kin" "‘¡Ê" nil 0)
    ("kinf" "‘¡Þ" nil 0)
    ("kit" "IntelliType" nil 0)
    ("kjs" "javascript" nil 0)
    ("kkb" "keyboard" nil 0)
    ("kkbd" "keybinding" nil 0)
    ("kll" "Linden Labs" nil 0)
    ("kluv" "—¦¾" nil 0)
    ("kmat" "\\mathbb{}" nil 1)
    ("kmma" "Mathematica" nil 0)
    ("kms" "Microsoft" nil 0)
    ("kmsw" "Microsoft Windows" nil 0)
    ("knin" "—¢Æ" nil 0)
    ("knum" "\\([0-9]+?\\)" nil 0)
    ("kpr" "POV-Ray" nil 0)
    ("kps" "PowerShell" nil 0)
    ("kqt" "QuickTime" nil 0)
    ("krsync" "rsync -z -r -v -t --exclude=\"*~\" --exclude=\".DS_Store
\" --exclude=\".bash_history\" --exclude=\"**/xx_xahlee_info/*\"  --
exclude=\"*/_curves_robert_yates/*.png\" --exclude=\"logs/*\"  --
exclude=\"xlogs/*\" --delete --rsh=\"ssh -l xah\" ~/web/
x...@example.com:~/" nil 0)
    ("krsync2" "rsync -r -v -t --delete --rsh=\"ssh -l xah\" ~/web/
x...@example.com:~/web/" nil 0)
    ("krsync3" "rsync -r -v -t --delete --exclude=\"**/My *\" --rsh=
\"ssh -l xah\" ~/Documents/ x...@example.com:~/Documents/" nil 0)
    ("ksftp" "sftp x...@xahlee.org" nil 0)
    ("ksl" "Second Life" nil 0)
    ("ksmly" "œò£º" nil 0)
    ("kssh" "ssh x...@xahlee.org" nil 0)
    ("kstr" "\\([^\"]+?\\)\"" nil 0)
    ("ku3dxm" "http://3D-XplorMath.org/" nil 0)
    ("kuee" "http://ergoemacs.org/" nil 0)
    ("kunison" "unison -servercmd /usr/bin/unison c:/Users/xah/web
ssh://...@example.com//Users/xah/web" nil 0)
    ("kuvmm" "http://VirtualMathMuseum.org/" nil 0)
    ("kuxl" "http://xahlee.org/" nil 0)
    ("kuxp" "http://xahporn.org/" nil 0)
    ("kvar" "variable" nil 0)
    ("kvb" "Visual Basic" nil 0)
    ("kwdy" "wordy-engl...@yahoogroups.com" nil 0)
    ("kwhi" "while ()" nil 0)
    ("kwin" "Windows" nil 0)
    ("kwp" "Wikipedia" nil 0)
    ("kxl" "Xah Lee" nil 0)
    ("kxs" " Xah ‘¡Æ xahlee.org œò¢ä" nil 0)
    ("kyt" "YouTube" nil 0)
   ))

(define-abbrev-table 'gnus-article-edit-mode-abbrev-table '())

(define-abbrev-table 'gnus-sticky-article-mode-abbrev-table '())

(define-abbrev-table 'google-maps-static-mode-abbrev-table '())

(define-abbrev-table 'idl-mode-abbrev-table '())

(define-abbrev-table 'java-mode-abbrev-table '())

(define-abbrev-table 'latex-mode-abbrev-table '())

(define-abbrev-table 'lisp-mode-abbrev-table '())

(define-abbrev-table 'log-edit-mode-abbrev-table '())

(define-abbrev-table 'magit-log-edit-mode-abbrev-table '())

(define-abbrev-table 'message-mode-abbrev-table '())

(define-abbrev-table 'objc-mode-abbrev-table '())

(define-abbrev-table 'org-mode-abbrev-table '())

(define-abbrev-table 'outline-mode-abbrev-table '())

(define-abbrev-table 'pike-mode-abbrev-table '())

(define-abbrev-table 'shell-mode-abbrev-table '())

(define-abbrev-table 'snippet-mode-abbrev-table '())

(define-abbrev-table 'special-mode-abbrev-table '())

(define-abbrev-table 'svn-log-edit-mode-abbrev-table '())

(define-abbrev-table 'svn-log-view-mode-abbrev-table '())

(define-abbrev-table 'svn-status-diff-mode-abbrev-table '())

(define-abbrev-table 'text-mode-abbrev-table '())

(define-abbrev-table 'vc-svn-log-view-mode-abbrev-table '())

