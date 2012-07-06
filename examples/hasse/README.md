      
                                        
                 README: Random generation of Hasse-diagrams
                 *******************************************
                  Copyright   (C)   2006  Markus Mottl (1)  
                  ==========================================
                      Vienna, 						16th	January, 2006 
                      =================================
  

1  Usage information
*=*=*=*=*=*=*=*=*=*=

  
  To run this example you need to install the dot-utility first, which you can
find in the GraphViz-distribution of AT&T:
  
      http://www.research.att.com/sw/tools/graphviz
  
  This utility can draw directed graphs given a human-readable specification.
  
  After compilation of the --hasse---binary (make), just run it, possibly
setting some options, about which you can learn by entering --hasse -help--.
This will print a graph-specification as required by the --dot---utility to
standard output. If you want to visualize this graph, just redirect the
specification to some file to be read by --dot-- or pipe it to this utility
directly:
  
      hasse | dot -Tps -o foo.ps
  
  This will generate a nicely rendered PostScript-file --foo.ps--, which you
can visualize with your favourite viewer (e.g. --gv--).
  
  Play around with some hasse-options to get a feeling for partially ordered
sets. The implementation of the hasse-tool is very simple and can be easily
extended to render any kind of partially ordered structure with the
--dot---utility.
  

2  Contact information
*=*=*=*=*=*=*=*=*=*=*=

  
  In the case of bugs, feature requests and similar, you can contact me here:
  
    markus.mottl@gmail.com
  
  Up-to-date information concerning this library should be available here:
  
    http://www.ocaml.info/ocaml_sources
  
  Enjoy!!
  
--------------------------------------
  
 
 (1) http://www.ocaml.info/
-----------------------------------------------------------------------------
  
               This document was translated from LaTeX by HeVeA (2).
