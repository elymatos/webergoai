(TeX-add-style-hook "manual2"
 (lambda ()
    (LaTeX-add-index-entries
     " #1"
     "CDF predicates!#1"
     "\\texttt{#2}"
     "CDF identifiers! #1"
     "components! #1"
     "contexts! #1"
     "files!{\\tt #1}"
     "predicates!#1"
     "domains!#1"
     "#1")
    (LaTeX-add-bibliographies
     "manual"
     "pita")
    (LaTeX-add-environments
     "definition"
     "dummylemma"
     "DefinitioN"
     "example"
     "Prog"
     "axiom"
     "instance"
     "proposition")
    (TeX-add-symbols
     '("stuff" 1)
     '("emindex" 1)
     '("ttindex" 1)
     '("ctxtexc" 1)
     '("refexer" 1)
     '("refexam" 1)
     '("secref" 1)
     '("refdef" 1)
     '("refsec" 1)
     '("refchap" 1)
     '("domain" 1)
     '("pred" 1)
     '("file" 1)
     '("context" 1)
     '("component" 1)
     '("class" 1)
     '("rid" 1)
     '("crid" 1)
     '("oid" 1)
     '("cid" 1)
     '("ourrepeatmoditem" 3)
     '("altourmoditem" 3)
     '("ourmoditem" 2)
     '("ourrepeatnewitem" 2)
     '("ournewitem" 2)
     '("ouritem" 1)
     '("ourrepeatitem" 1)
     '("desce" 1)
     '("desc" 1)
     '("demo" 1)
     '("ourpredmoditem" 2)
     '("ourpredmodrptitem" 2)
     '("comment" 1)
     '("mtsection" 1)
     '("myindex" 1)
     "newsched"
     "Newsched"
     "NewSched"
     "Oldsched"
     "OldSched"
     "oldsched"
     "localsched"
     "Localsched"
     "LocalSched"
     "bi"
     "ei"
     "smallourprolog"
     "version"
     "LRD"
     "cA"
     "cB"
     "cC"
     "cD"
     "cE"
     "cF"
     "cG"
     "cH"
     "cI"
     "cJ"
     "cK"
     "cL"
     "cM"
     "cN"
     "cO"
     "cP"
     "cQ"
     "cR"
     "cS"
     "cT"
     "cU"
     "cV"
     "cW"
     "cX"
     "inhdash"
     "lra"
     "Ra"
     "longline"
     "xsblogo"
     "cut"
     "not")
    (TeX-run-style-hooks
     "url"
     "hyperref"
     "colorlinks"
     "ecltree"
     "epic"
     "longtable"
     "imakeidx"
     "graphicx"
     "alltt"
     "amssymb"
     "xspace"
     "latexsym"
     "subfigure"
     "epsfig"
     "epsf"
     "fontenc"
     "T1"
     "lmodern"
     ""
     "latex2e"
     "rep12"
     "report"
     "12pt"
     "predindex"
     "credits2"
     "odbc_man/odbc_man"
     "xsb_dbi"
     "other_libraries"
     "packages"
     "wildmatch"
     "pcre"
     "posixmatch"
     "curl"
     "sgml2pl"
     "rdf"
     "clpr"
     "chr"
     "viewsys"
     "persistent_tables"
     "pita"
     "minizinc"
     "xsbpy"
     "xasp"
     "pkg-json")))

