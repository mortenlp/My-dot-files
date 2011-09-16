; my personal abbreviations
(define-abbrev-table 'global-abbrev-table '(

    ;; math/unicode symbols
    ("kin" "∈" nil 0)
    ("knin" "∉" nil 0)
    ("kinf" "∞" nil 0)
    ("kluv" "♥" nil 0)
    ("ksmly" "☺" nil 0)

    ;; Mortens Stuff!
    ("kwhi" "while ()" nil 0)
    ("kcol" "\\vcentcolon" nil 0)
    ("kmat" "\\mathbb{}" nil 0)
    ("kcal" "\\mathcal{}" nil 0)

    ;; email
    ("kwdy" "wordy-engl...@yahoogroups.com" nil 0)

    ;; computing tech
    ("kwp" "Wikipedia" nil 0)
    ("kms" "Microsoft" nil 0)
    ("kg" "Google" nil 0)
    ("kqt" "QuickTime" nil 0)
    ("kit" "IntelliType" nil 0)
    ("kmsw" "Microsoft Windows" nil 0)
    ("kwin" "Windows" nil 0)
    ("kie" "Internet Explorer" nil 0)
    ("kahk" "AutoHotkey" nil 0)
    ("kpr" "POV-Ray" nil 0)
    ("kps" "PowerShell" nil 0)
    ("kmma" "Mathematica" nil 0)
    ("kjs" "javascript" nil 0)
    ("kvb" "Visual Basic" nil 0)
    ("kyt" "YouTube" nil 0)
    ("kge" "Google Earth" nil 0)
    ("kff" "FireFox" nil 0)
    ("ksl" "Second Life" nil 0)
    ("kll" "Linden Labs" nil 0)
    ("kcs" "Chthonic Syndicate" nil 0)
    ("kee" "ErgoEmacs" nil 0)

    ;; normal english words
    ("kalt" "alternative" nil 0)
    (".alt" "alternative" nil 0)
    ("kchar" "character" nil 0)
    ("kdef" "definition" nil 0)
    ("kbg" "background" nil 0)
    ("kkb" "keyboard" nil 0)
    ("kex" "example" nil 0)
    ("kkbd" "keybinding" nil 0)
    ("kenv" "environment" nil 0)
    ("kvar" "variable" nil 0)
    ("kev" "environment variable" nil 0)
    ("kcp" "computer" nil 0)

    ;; sig
    ("kxl" "Xah Lee" nil 0)
    ("kxs" " Xah ∑ xahlee.org ☄" nil 0)

    ;; url
    ("kuxl" "http://xahlee.org/" nil 0)
    ("kuxp" "http://xahporn.org/" nil 0)
    ("kuee" "http://ergoemacs.org/" nil 0)
    ("kuvmm" "http://VirtualMathMuseum.org/" nil 0)
    ("ku3dxm" "http://3D-XplorMath.org/" nil 0)

    ;; emacs regex
    ("knum" "\\([0-9]+?\\)" nil 0)
    ("kstr" "\\([^\"]+?\\)\"" nil 0)
    ("kcurly" "“\\([^”]+?\\)”" nil 0)

    ;; shell commands
    ("kditto" "ditto -ck --sequesterRsrc --keepParent src dest" nil 0)
    ("kim" "convert -quality 85% " nil 0)
    ("kims" "convert -size  -quality 85% " nil 0)
    ("kim256" "convert +dither -colors 256 " nil 0)
    ("kimf" "find . -name \"*png\" | xargs -l -i basename \"{}\" \".png
\" | xargs -l -i  convert -quality 85% \"{}.png\" \"{}.jpg\"" nil 0)

    ("k0" "find . -type f -empty" nil 0)
    ("k00" "find . -type f -size 0 -exec rm {} ';'" nil 0)
    ("kchmod" "find . -type f -exec chmod 644 {} ';'" nil 0)
    ("kchmod2" "find . -type d -exec chmod 755 {} ';'" nil 0)

    ("kunison" "unison -servercmd /usr/bin/unison c:/Users/xah/web
ssh://...@example.com//Users/xah/web" nil 0)
    ("ksftp" "sftp x...@xahlee.org" nil 0)
    ("kssh" "ssh x...@xahlee.org" nil 0)
    ("krsync" "rsync -z -r -v -t --exclude=\"*~\" --exclude=\".DS_Store
\" --exclude=\".bash_history\" --exclude=\"**/xx_xahlee_info/*\"  --
exclude=\"*/_curves_robert_yates/*.png\" --exclude=\"logs/*\"  --
exclude=\"xlogs/*\" --delete --rsh=\"ssh -l xah\" ~/web/
x...@example.com:~/" nil 0)

    ("krsync2" "rsync -r -v -t --delete --rsh=\"ssh -l xah\" ~/web/
x...@example.com:~/web/" nil 0)
    ("krsync3" "rsync -r -v -t --delete --exclude=\"**/My *\" --rsh=
\"ssh -l xah\" ~/Documents/ x...@example.com:~/Documents/" nil 0)
    ))
