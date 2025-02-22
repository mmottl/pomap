# Changelog

## [4.1.2] - 2024-12-01

### Improved

- Documentation.

### Changed

- Formatted all OCaml code with `ocamlformat`.
- Switched to OPAM file generation via `dune-project`.

## [4.1.1] - 2018-10-25

### Changed

- Updates for dune-release and OPAM 2.0.

## [4.1.0] - 2018-08-23

### Changed

- Switched to Dune.

## [4.0.0] - 2017-08-02

### Changed

- Switched to jbuilder and topkg.

## Changes Before Version 4.0.0

```text
2017-03-29:  Compilation fixes for OCaml 4.05.

2016-08-18:  Compilation fixes for OCaml 4.04.

2014-10-01:  Compilation fixes for OCaml 4.02.

2014-07-06:  Moved to GitHub.

2013-08-19:  Fixed API compatibility problem wrt. OCaml 4.01.

             Thanks to Alexis Ballier for the report.

2012-07-20:  Downgraded findlib version constraint to support the Debian
             testing branch.

2012-07-15:  New major release version 3.0.0:

               * Upgraded to OCaml 4.00
               * Switched to Oasis for packaging
               * Switched to OCamlBuild for the build process
               * Rewrote README in Markdown
               * Added stricter compilation flags

2006-11-22: Updated OCamlMakefile.

2006-07-26: Improved documentation.

2004-07-01: Fixed is_empty-function. It now uses the newly available
            Map.is_empty function.

            Updated OCamlMakefile.

2004-04-19: Added split-function to ptset.

            Updated OCamlMakefile.

2003-11-23: Updated OCamlMakefile.

2003-01-07: Updated OCamlMakefile to make use of "findlib".

2002-12-03: Replaced union1 and union2 with one union-function.
            Replaced inter1 and inter2 with one inter-function.

2002-09-25: Fixed example, wnich was mistakenly changed during some
            test application.

2002-09-11: Updated OCamlMakefile and license.

            Documented all modules for use with ocamldoc.

2002-05-04: Revised the whole installation procedure. See INSTALL for
            details.

2002-04-30:  Updated OcamlMakefile: it does not ask for confirmation
             during installation anymore.

2002-04-04: Renamed pretty-printing functions for consistency.

2002-03-08: Added new functions to pomap (see interface documentation
            for details):

             * take
             * take_ix
             * choose
             * filter
             * partition
             * fold_split_eq_classes
             * preorder_eq_classes
             * topo_fold_reduced

2002-02-27: Added new functions to pomap (see interface documentation
            for details):

              * cardinal
              * singleton
              * add_node
              * remove_node
              * mem_ix
              * find_ix
              * topo_fold_ix
              * rev_topo_fold_ix
              * union1, union2
              * inter1, inter2
              * diff
              * fold_eq_classes

            Added new functions to store:

              * cardinal
              * singleton

            Slightly modified the Hasse-example.

            Updated OcamlMakefile.

2002-02-18: Added new functions to pomap (see interface documentation
            for details):

              * remove_eq_prds
              * rev_topo_fold, rev_topo_foldi
              * rev_chain_fold, rev_chain_foldi

            Slightly extended the Hasse-example.

2002-02-04: Fixed bug in function "is_empty".

            Added functions "chain_fold" and "chain_foldi", which fold
            over chains of ascending elements (see interface for details).

            Updated OcamlMakefile.

2001-08-01: Fixed bug in example "hasse".

2001-07-31: Changed order of arguments for some functions to make them
            more like the set/map-functions in the standard
            library. Sorry for the inconvenience.

2001-07-30: Added more modules to "pomap": they contain functionality
            to generate specifications for the dot-utility to render
            Hasse-diagrams. This functionality is now factored out of
            the Hasse-example. See the following files for documentation:

              lib/display_hasse_intf.mli
              lib/display_hasse_impl.mli

            The Hasse-example now demonstrates this functionality.

2001-07-27: Incompatible change: removed "get_graph" and introduced "get_nodes"
            (with a slightly different type).

2001-07-26: Added function "create_node".

2001-07-26: Small optimization.

2001-07-24: Incompatible change: the "Added"-constructor returned by
            "add_find" now also tells you the added node. This was
            important, because it could be interesting to know the
            neighbours of a newly inserted node.

2001-07-18: Added functions "topo_fold" and "topo_foldi" that fold
            over elements in topological order.

2001-07-17: First release.
```
