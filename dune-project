(lang dune 2.7)
(name pomap)

(generate_opam_files true)

(source (github mmottl/pomap))
(license "LGPL-2.1-or-later WITH OCaml-LGPL-linking-exception")
(homepage "https://mmottl.github.io/pomap")
(documentation "https://mmottl.github.io/pomap/api")

(maintainers "Markus Mottl <markus.mottl@gmail.com>")
(authors "Markus Mottl <markus.mottl@gmail.com>")

(package
  (name pomap)
  (synopsis "POMAP - Partially Ordered Maps for OCaml")
  (description "\
POMAP supports creating and manipulating partially ordered maps in a purely
functional and efficient way.")
  (depends
    (ocaml (>= 4.08))
  )
)
