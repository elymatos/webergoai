(TeX-add-style-hook "module_system"
 (lambda ()
    (LaTeX-add-index-entries
     "Prolog flags!{\\tt unknown}"
     "xsbdoc"
     "declarations!\\texttt{document\\_export/1}"
     "declarations!\\texttt{document\\_import/1}")
    (LaTeX-add-labels
     "Modules")))

