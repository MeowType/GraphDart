part of meowtype.graph;

class GraphQuery_Base_Add extends GraphQuery<GraphBase, GraphQuery_Base_Add> with GraphQueryGETNodeMixin<GraphQuery_Base_Add_Node, GraphQuery_Base_Add> {
  GraphQuery_Base_Add(IGraph graph) : super(graph);

  GraphQuery_Base_Add_Node<T> nodeBy<T>(T node, [space = NoneSpace]) => GraphQuery_Base_Add_Node<T>(this, node, space);
}

class GraphQuery_Base_Add_Node<T> extends GraphQuery_Node<T, GraphQuery_Base_Add> implements GraphQuery_End<bool> {
  GraphQuery_Base_Add_Node(GraphQuery_Base_Add parent, T node, [space = NoneSpace]) : super(parent, node, space);

  bool get end => _parent._graph._to_add(_node, _space);
}
