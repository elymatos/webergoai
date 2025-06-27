(TeX-add-style-hook "otherpackages"
 (lambda ()
    (LaTeX-add-index-entries
     "WFSX"
     "negation!explicit negation"
     "Generalized Annotated Programs")
    (LaTeX-add-labels
     "sec:otherpackages"
     "package:flora2"
     "package:xmc"
     "package:xsm"
     "package:cdf"
     "package:wfsx"
     "library_utilities:gap")
    (TeX-run-style-hooks
     "florablurb")))

