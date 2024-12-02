# `hasse` - Random Generation of Hasse-Diagrams

## Usage

To run this example you need to install the dot-utility first, which you can
find in the [Graphviz](http://www.graphviz.org) distribution. This utility
can draw directed and undirected graphs given a human-readable specification.

You can build and execute the example as follows:

```sh
dune exec ./hasse.exe --help
```

Running `hasse.exe` by itself will print a random graph-specification as
required by the `dot`-utility to standard output. If you want to visualize
this graph, redirect the specification to some file for `dot` or pipe it to
this utility directly, e.g.:

```sh
dune exec ./hasse.exe | dot -Tpdf -o foo.pdf
```

This will generate a nicely rendered PDF-file `foo.pdf`, which you can
visualize with your favorite viewer.

Experiment with command-line options to understand partially ordered sets.
You can extend the `hasse`-tool implementation to render any kind of partially
ordered structure using the `dot`-utility.

---

## Contact Information and Contributing

Up-to-date information is available at: <http://mmottl.github.io/pomap>
