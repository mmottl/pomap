# POMAP - Partially Ordered Maps for OCaml

## What is `Pomap`?

The Pomap library provides purely functional maps for partially ordered
elements. These maps are like partially ordered sets but map values with a
defined partial order relation to arbitrary other values. Here's an example
of a partially ordered set:

![Hasse Diagram of a Partially Ordered Set](http://mmottl.github.io/pomap/hasse.png "Hasse Diagram of a Partially Ordered Set")

While total orders let you determine if an element is smaller, equal, or
greater than another, partial orders introduce a "don't know" or "undefined"
case.

Mathematically, a partial order relation satisfies these axioms:

```text
          x <= x            (reflexivity)
x <= y /\ y <= x -> x = y   (antisymmetry)
x <= y /\ y <= z -> x <= z  (transitivity)
```

Total orders, used in typical maps, also require:

```text
x <= y \/ y <= x  (totality)
```

Total orders align elements linearly (e.g., `[1; 3; 7; 42]`), while partial
orders are often represented by graphs, such as Hasse diagrams. Here's another
example:

```text
                           (89,73)   (93,21)
                              |
                  (91,38)  (57,42)
                     |    /   |
                     |   /    |
                  (44,26)  (25,42)
                      \       /
                       (22,23)
```

In this structure, pairs of integers are elements. A pair is larger if both
integers are larger than those in another pair. If both are smaller, the
pair is smaller. If pairs have equal elements, they are equal. If neither
condition holds, the order is "unknown" (e.g., pairs (44,26) and (25,42)).

Lines show order: the greater element appears above the smaller one. Hasse
diagrams omit lines implied by transitivity. For example, there's no line
between (89,73) and (25,42). If elements are unreachable without reversing
direction, they are incomparable (e.g., (93,21) is incomparable to others).

Internally, the library represents relations similarly to Hasse diagrams,
enabling easy reasoning and quick manipulation.

## Application Areas

### Data Mining

Concept lattices, which have a similar structure as partial orders, can be
managed with this library. For instance, an e-commerce site could use it to
identify frequently bought product baskets.

### Databases

Partial order structures can optimize database queries on multi-valued
attributes by improving indexing.

## Advantages of This Library

### Referential Transparency

Functions handle data structures purely functionally, allowing more than
one version in memory with structure sharing. This makes reverting changes
efficient and safe for multi-threaded environments.

### Incremental Updates

Unlike algorithms that generate Hasse diagrams in batches, this library
supports efficient incremental updates, adding or removing elements as needed.

### Efficiency

Time and memory consumption are suitable for practical problems. Building a
Hasse diagram for 1000 elements of moderate complexity typically takes less
than a second on modern machines.

## Usage

## API Documentation

Refer to the API documentation for programming reference, built during
installation with `make doc`. The API documentation is also available
[online](http://mmottl.github.io/pomap/api/pomap).

## Specifying the Partial Order Relation

Provide a function that computes the partial order relation between two
elements. See the `PARTIAL_ORDER` signature in `lib/pomap_intf.ml`:

```ocaml
module type PARTIAL_ORDER = sig
  type el
  type ord = Unknown | Lower | Equal | Greater
  val compare : el -> el -> ord
end
```

Specify the element type and a comparison function returning `Unknown` if
elements are incomparable, `Lower` if the first is lower, `Equal` if equal,
and `Greater` if the first is greater. Example implementations are in
`examples/hasse/po_examples.ml`.

## Creating and Using Partially Ordered Maps

With a partial order relation specification, e.g., `MyPO`, create a map:

```ocaml
module MyPOMap = Pomap_impl.Make(MyPO)
```

The `POMAP` interface in `lib/pomap_intf.ml` defines functions for partially
ordered maps. Nodes store information, accessible by key, data element,
successor indices, and predecessor indices. The system generates fresh indices
for new nodes.

Accessors for bottommost and topmost node indices allow for navigation in
the Hasse diagram.

## Rendering Hasse Diagrams

The library includes modules for rendering Hasse diagrams using pretty-printing
functions. This requires the [Graphviz](http://www.graphviz.org) package and
its `dot` utility. The `hasse` example demonstrates usage and includes a README.

## Contact Information and Contributing

Submit bug reports, feature requests, or contributions to the
[GitHub issue tracker](https://github.com/mmottl/pomap/issues).

Find up-to-date information at: <https://mmottl.github.io/pomap>
