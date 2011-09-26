(define-skeleton latex-skeleton
  "\n"
  "\n"
  "%Dokumentklassen sættes til memoir\n"
  "\\documentclass[a4paper,11pt,article,oneside]{memoir}\n\n"
  "%Sproget sættes til dansk og orddeling indlæses\n"
  "\\usepackage[utf8]{inputenc}\n"
  "\\usepackage[T1]{fontenc}\n"
  "\\usepackage[danish]{babel}\n"
  "\\usepackage{lmodern}\n\n"
  "%Matematiske symboler og fede tegn i ligninger\n"
  "\\usepackage{amsmath, amssymb, bm, mathtools}\n\n"
  "%Tabeller og søjler\n"
  "\\usepackage{array, booktabs}\n"
  "\\usepackage{siunitx}\n\n"
    "%Figurer\n"
  "\\usepackage{graphicx, caption, subfig}\n"
  "\\captionsetup{font=small,labelfont=bf}\n\n"
  "\\begin{document}\n"
  "" _ "\n"
  "\\end{document}\n")

(define-skeleton java-skeleton
  "Dasdaf"
  \n
  \n
  > "public class "
  (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))
  " {" \n
  \n
  "/**" \n
  "*" > \n
  "* @author " > \n
  "* @version " > \n
  "**/" > \n
  \n
  > "public static void main ( String args[] ) {" \n
  > _ \n
  "}" > \n
  \n
  "}" > \n
  )

(global-set-key [(f2)] 'java-skeleton)
(global-set-key [(f1)] 'latex-skeleton)
