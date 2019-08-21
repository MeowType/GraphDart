part of meowtype.graph;

/// Contains implementations of all graph features
class FullGraph
    with
        GraphBase,
        UndirectedGraph,
        UndirectedValueGraph,
        DirectedGraph,
        DirectedValueGraph,
        IterableMixin
    implements Graph {}
