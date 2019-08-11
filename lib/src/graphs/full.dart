part of meowtype.graph;

/// Contains implementations of all graph features
class FullGraph
    with
        GraphItemsMixin,
        UndirectedGraphMixin,
        UndirectedValueGraphMixin,
        DirectedGraphMixin,
        DirectedValueGraphMixin,
        GraphGetMixin,
        IterableMixin
    implements Graph {}
