part of meowtype.graph;

/// Directed graph, can set the direction of the edge
abstract class DirectedGraph extends GraphItems {
  factory DirectedGraph() = FullGraph;
  /// Link a directed link, if [from] and [to] don't exist, they will be added
  void linkTo(from, to);
  /// Determine if there is such a directed link
  bool hasLinkTo(from, to);
  /// Remove a directed link, but will not remove [from] and [to]
  bool unLinkTo(from, to);
  /// Get all links link from [val]
  Iterable linkTos(val);
  /// Get all links link to [val]
  Iterable linkFroms(val);
}

/// Mixing of implementations of [DirectedGraph]
mixin DirectedGraphMixin on GraphItemsMixin implements DirectedGraph {
  void linkTo(from, to) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    _t.setFrom(_f);
    _f.setTo(_t);
  }

  bool hasLinkTo(from, to) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    return _f.hasTo(_t);
  }

  bool unLinkTo(from, to) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    final a = _f.unsetTo(_t);
    final b = _t.unsetFrom(_f);
    return a || b;
  }

  Iterable linkTos(val) {
    final _v = _map_add_or_get(val, _newNode);
    final to = _v.to.keys.map((n) => _node_to_val[n]);
    return to;
  }

  Iterable linkFroms(val) {
    final _v = _map_add_or_get(val, _newNode);
    final from = _v.from.map((n) => _node_to_val[n]);
    return from;
  }
}
