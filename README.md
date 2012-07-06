      
                                        
                           README: library "Pomap"
                           ***********************
                  Copyright   (C)   2008  Markus Mottl (1)  
                  ==========================================
                          Vienna, November 29, 2008
                          =========================
  

1  Directory contents
*=*=*=*=*=*=*=*=*=*=*

   
                                        
 ---------------------------------------------------------------------------
 |     Changes       |                History of code changes              |
 ---------------------------------------------------------------------------
 |     INSTALL       |  Short notes on compiling and installing the library|
 ---------------------------------------------------------------------------
 |     LICENSE       |   A copy of the "GNU LESSER GENERAL PUBLIC LICENSE" |
 ---------------------------------------------------------------------------
 |     Makefile      |                     Top Makefile                    |
 ---------------------------------------------------------------------------
 |  OcamlMakefile    |   Makefile for easy handling of compilation of not  |
 |                   |   so easy OCaml-projects. It generates dependencies |
 |                   |    of Ocaml-files automatically, is able to handle  |
 |                   |    "ocamllex"-, "ocamlyacc"-, IDL- and C-files and  |
 |                   |   generates native- or byte-code, as executable or  |
 |                   |     as library - with thread-support if you want!   |
 ---------------------------------------------------------------------------
 |    README.txt     |                       This file                     |
 ---------------------------------------------------------------------------
 |  examples/hasse   |    "hasse" depends on the dot-utility to visualize  |
 |                   |               partial-order structures              |
 ---------------------------------------------------------------------------
 |       lib         |          Implementation of the pomap-library        |
 ---------------------------------------------------------------------------
                                        


2  What is the "Pomap"-library?
*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*

   The Pomap-library implements an ADT that maintains maps of partially
ordered elements. Whereas a total order allows you to say whether some element
is lower, equal or greater than another one, partial orders also allow for a
"don't know"-case. More precisely, the axioms that hold for a partial order
relation are the following:
  
   
           x <= x               (reflexivity) 
 x <= y AND y <= x -> x = y    (antisymmetry) 
 x <= y AND y <= z -> x <= z   (transitivity) 
  
  Partially ordered maps map values over which a partial order relation is
defined to other values. Total orders, as they are usually used for "normal"
maps, additionally require the following axiom:
  
   
 x <= y OR y <= x   (totality) 
  
  Whereas a total order allows you to align elements in a linear way to
exhibit this order relation (e.g. [1; 3; 7; 42;]), partial orders are usually
represented by graphs (so-called Hasse-diagrams). Here is an example:
  
   The elements of our example partial order structure are tuples of integers.
We say that an element (a tuple) is larger than another one iff both of its
integers are larger than the respective integers in the other tuple. Iff both
integers are lower, than the tuple is lower, and iff the two tuples contain
equal elements, they are equal. If none of the above holds e.g. iff the first
element of the first tuple is lower than the corresponding one of the second
tuple and the second element of the first tuple is greater than its
corresponding element of the second tuple, then we cannot say that either of
the tuples is greater or lower, i.e. the order is "unknown" (e.g. tuples
(42,1) and (3,7)).
  
   A Hasse-graph of several such tuple-elements might be:
  
   
<<                              (89,73)   (93,21)
                                   |
                      (91,38)  _(57,42)
                         |    /    |
                         |   /     |
                      (44,26)   (25,42)
                          \       /
                           (22,23)
>>
  
  Lines connecting elements indicate the order of the elements: the greater
element is above the lower element. Hasse-diagrams do not display the order if
it is implied by transitivity (e.g. there is no separate line for the elements
(89,73) and (25,42)). If elements cannot be reached on lines without reversing
direction, then they cannot be compared. E.g. the tuple (93,21) is
uncomparable to all others, whereas (44,26) cannot be compared to this latter
tuple and to (25,42) only.
  This library internally represents relations between known elements in a
similar way as in the Hasse-diagram. This allows you to easily reason about or
quickly manipulate such structures.
  

3  Why would you need it?
*=*=*=*=*=*=*=*=*=*=*=*=*

  
  Sounds too mathematical so far? There are many uses for such a library!
  

3.1  Application areas
======================


3.1.1  Data-mining
------------------
  
  Concept lattices obey very similar rules as partial orders and can also be
handled using this library. E.g., you might have a big e-commerce site with
lots of products. For marketing purposes it would be extremely useful to know
product baskets that people frequently buy. Or imagine you develope a medical
system that automatically associates different mixes of medication with
illnesses they effectively treat to support doctors in deciding on a therapy.
This can all be addressed with concept lattices.
  

3.1.2  Software engineering
---------------------------
  
  Refactoring software to reduce complexity is a very important task for large
software projects. If you have many different components that implement many
different features, you might want to know whether there are groups of
components that make use of specific features in other components. You could
then find out whether the current form of abstraction exactly meets these
dependencies, possibly learning that you should factor out a set of features
in a separate module to reduce overall complexity.
  

3.1.3  Databases
----------------
  
  Partial order structures represented by Hasse-diagrams can be used to
optimize database queries on multi-value attributes by providing better ways
of indexing.
  

3.1.4  General problem-solving
------------------------------
  
  The least we need to know to learn how to solve general problems is whether
some solution is better, equal to, worse or uncomparable to another. Given a
large number of known solutions, the partial order structure containing the
elements can be used to draw conclusions about e.g. whether their particular
form (syntax) implies anything about their position in the partial order
(semantic aspect).
  

3.2  What advantages does this particular library offer?
========================================================


3.2.1  Referential transparency
-------------------------------
  
  The currently implemented functions all handle the datastructure in a purely
functional way. This allows you to hold several versions of a datastructure in
memory while benefiting from structure sharing. This makes backtracking of
changes to the datastructure efficient and straightforward and also allows you
to use the library safely in a multi-threaded environment.
  

3.2.2  Incremental updates
--------------------------
  
  Some algorithms only perform batch generation of Hasse-diagrams: once the
diagram has been computed, one cannot use this algorithm to add further
elements to it incrementally. This library can handle incremental updates
(adding and removing of elements) fairly fast as required for online-problems.
  

3.2.3  Efficiency
-----------------
  
  I do not have any other comparable algorithms at hand, but both time and
memory consumption seem to be pretty good even on not so small problems.
Building up the Hasse-diagram for 1000 elements of a moderately complex
partial order should usually take less than a second with native code on
modern machines.
  

4  How can you use it?
*=*=*=*=*=*=*=*=*=*=*=



4.1  Specification of the partial order relation
================================================
  
  All you need to provide is the function that computes the partial order
relation between two elements. Take a look at the signature "PARTIAL_ORDER" in
file "lib/pomap_intf.mli":
  
   
<<  module type PARTIAL_ORDER = sig
      type el
      type ord = Unknown | Lower | Equal | Greater
      val compare : el -> el -> ord
    end
>>
  
  You only have to specify the type of elements of the partially ordered
structure and a comparison function that returns "Unknown" if the elements are
not comparable, "Lower" if the first element is lower than the second, "Equal"
when they are equal and "Greater" if the first element is greater than the
second one. You can find example implementations of such modules in directory
"examples/hasse/po_examples.ml".
  

4.2  Creating and using partially ordered maps
==============================================
  
  Given the specification "MyPO" of a partial order relation, we can now
create a map of partially ordered elements like this:
  
   
<<  module MyPOMap = Pomap_impl.Make (MyPO)
>>
  
  The interface specification "POMAP" in file "lib/pomap_intf.mli" documents
in detail all the functions that can be applied to partially ordered maps and
objects they maintain. The important aspect is that information is stored in
nodes: you can access the key on which the partial order relation is defined,
the associated data element, the set of indices of successors and the set of
indices of predecessors. Fresh indices are generated automatically for new
nodes.
  Together with accessors to the indices of the bottommost and topmost nodes
in the partially ordered map, this allows for easy navigation in the
associated Hasse-diagram.


4.3  Rendering Hasse-diagrams using the dot-utility
===================================================
  
  The Pomap-library also contains modules that allow you to easily render
Hasse-diagrams given some partially ordered map and pretty-printing functions
for elements. The use of these modules is demonstrated in the distributed
"hasse"-example.
  

5  Contact information
*=*=*=*=*=*=*=*=*=*=*=

  
  In the case of bugs, feature requests and similar, you can contact me here:
  
     markus.mottl@gmail.com
  
   Up-to-date information concerning this library should be available here:
  
     http://www.ocaml.info/ocaml_sources
  
   Enjoy!!
  
   
-----------------------------------------------------------------------------
  
   This document was translated from LaTeX by HeVeA (2).
--------------------------------------
  
  
 (1) http://www.ocaml.info/
 
 (2) http://hevea.inria.fr/index.html
