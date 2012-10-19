(define-skeleton latex-skeleton
  "\n"
  "\n"
  "%Dokumentklassen sættes til memoir\n"
  "\\documentclass[a4paper,11pt,article,oneside]{memoir}\n\n"
  "%Sproget sættes til engelsk og orddeling indlæses\n"
  "\\usepackage[utf8]{inputenc}\n"
  "\\usepackage[T1]{fontenc}\n"
  "\\usepackage[english]{babel}\n"
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
  > "public static void main (String args[]) {" \n
  > _ \n
  "}" > \n
  \n
  "}" > \n
  )

(define-skeleton beamer-skeleton
  "\n"
  "\n"
  "#+TITLE:     Title\n"
  "#+author:    Morten Leander Petersen\n"
  "#+EMAIL:     mortenlp2@gmail.com\n"
  "#+DATE:      2012-05-23 ons\n"
  "#+DESCRIPTION:\n"
  "#+KEYWORDS:\n"
  "#+LANGUAGE:  en\n"
  "#+OPTIONS:   H:3 num:t toc:t \\n:nil @:t ::t |:t ^:t -:t f:t *:t <:t\n"
  "#+OPTIONS:   TeX:t LaTeX:t skip:nil d:nil todo:t pri:nil tags:not-in-toc\n"
  "#+INFOJS_OPT: view:nil toc:nil ltoc:t mouse:underline buttons:0 path:http://orgmode.org/org-info.js\n"
  "#+EXPORT_SELECT_TAGS: export\n"
  "#+EXPORT_EXCLUDE_TAGS: noexport\n"
  "#+LINK_UP:\n"
  "#+LINK_HOME:\n"
  "#+XSLT:\n"
  "#+startup: beamer\n"
  "#+LaTeX_CLASS: beamer\n"
  "#+LaTeX_CLASS_OPTIONS: [bigger]\n"
  "#+BEAMER_FRAME_LEVEL: 2\n"
  "#+COLUMNS: %40ITEM %10BEAMER_env(Env) %9BEAMER_envargs(Env Args) %4BEAMER_col(Col) %10BEAMER_extra(Extra)\n"
  "#+latex_header: \\mode<beamer>{\\usetheme{Madrid}}\n"
  "#+latex_header: \\mode<beamer>{\\usetheme{Copenhagen}}\n"
  "#+latex_header: \\mode<beamer>{\\useoutertheme[subsection=false]{smoothbars}}\n"
  )
