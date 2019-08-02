part of MeowType.Graph;

class FullGraph
    with
        GraphItemsMixin,
        UndirectedGraphMixin,
        UndirectedValueGraphMixin,
        DirectedGraphMixin,
        DirectedValueGraphMixin,
        GraphGetMixin
    implements Graph {}
