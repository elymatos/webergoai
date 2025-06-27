(TeX-add-style-hook "inspection"
 (lambda ()
    (LaTeX-add-index-entries
     "residual program"
     "Incremental Dependency Graph (IDG)"
     "residual dependency graph"
     "termination!radial restraint"
     "radial restraint"
     "tripwires"
     "tripwires!timed call"
     "tripwires!max\\_memory")
    (LaTeX-add-labels
     "sec:suspend-analyze"
     "sec:table-dump"
     "sec:dep-graph"
     "sec:adjacency-lists"
     "sec:sdg-preds"
     "ex:get-sdg"
     "fig:sdg-break-1"
     "sec:idg-preds"
     "sec:rdg-preds"
     "ex:rdg"
     "sec:dependency-graph-manipulation"
     "ex:morph-sdg"
     "sec:tripwire")))

