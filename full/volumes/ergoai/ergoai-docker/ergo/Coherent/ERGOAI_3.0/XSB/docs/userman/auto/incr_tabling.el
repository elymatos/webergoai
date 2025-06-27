(TeX-add-style-hook "incr_tabling"
 (lambda ()
    (LaTeX-add-index-entries
     "tabling!incremental"
     "Incremental Dependency Graph (IDG)"
     "tabling!incremental!invalid subgoals"
     "view consistency"
     "tries!and incremental tabling"
     "tabling!opaque"
     "tabling!declarations"
     "residual dependency graph")
    (LaTeX-add-labels
     "sec:incremental_tabling"
     "sec:incr_examples"
     "sec:view-consistency"
     "sec:incr-update-tries"
     "sec:IDG-abs"
     "fig:abstraction"
     "sec:incr-preds1")))

