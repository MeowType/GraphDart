part of meowtype.graph;

/// Undirected graph, Can create an edge between 2 nodes
abstract class UndirectedGraph extends GraphItems {
  factory UndirectedGraph() = FullGraph;

  /// create an link between 2 nodes
  void link(a, b, {List tags});

  /// Determine if there is an link between 2 nodes, **No matter what direction**
  bool hasLink(a, b, {List anyTags, List allTags});

  /// Remove the link between 2 nodes
  bool unLink(a, b, {List anyTags, List allTags});

  /// Get all the links of this node
  Iterable links(val, {List anyTags, List allTags});
}

/// Mixing of implementations of [UndirectedGraph]
mixin UndirectedGraphMixin on GraphItemsMixin implements UndirectedGraph {
  void link(a, b, {List tags = const []}) {
    final t = _Tuple2(a, b).map((v) => _map_add_or_get(v, _newNode));
    _mutualT(t, (f, t) => f.setFrom(t));
    _mutualT(t, (f, t) => f.setTo(t));
    _mutualT(t, (f, t) => f.setTag(t, tags));
  }

  bool hasLink(a, b, {List anyTags = const [], List allTags = const []}) {
    return _Tuple2(a, b)
        .map((v) => _map_add_or_get(v, _newNode))
        .mutual((f, t) => _check_hasTo_and_all_any_tags(f, t,
            anyTags: anyTags, allTags: allTags))
        .toDo(_or);
  }

  bool unLink(a, b, {List anyTags = const [], List allTags = const []}) {
    return _Tuple2(a, b)
        .map((v) => _map_add_or_get(v, _newNode))
        .where((t) => t
            .mutual((f, t) => _check_hasTo_and_all_any_tags(f, t,
                anyTags: anyTags, allTags: allTags))
            .toDo(_or))
        .some((t) => t
            .fork()
            .mapFn<bool Function(_Node, _Node), _Tuple2<bool>>(
                (t) => (fn) => t.mutual(fn))
            .allDo((f, t) => f.unsetTo(t), (f, t) => f.unsetFrom(t))
            .map((t) => t.toDo(_or))
            .toDo(_or))
        .defaultVal(false)
        .val;
  }

  Iterable links(val, {List anyTags = const [], List allTags = const []}) {
    final _v = _map_add_or_get(val, _newNode);
    if (anyTags.length == 0 && allTags.length == 0) {
      final from = _v.from.map((n) => _node_to_val[n]);
      final to = _v.to.keys.map((n) => _node_to_val[n]);
      return _concat(from, to).toSet();
    } else {
      final from = _v.from
          .where((n) =>
              _check_all_any_tags(n, _v, anyTags: anyTags, allTags: allTags))
          .map((n) => _node_to_val[n]);
      final to = _v.to.keys
          .where((n) =>
              _check_all_any_tags(_v, n, anyTags: anyTags, allTags: allTags))
          .map((n) => _node_to_val[n]);
      return _concat(from, to).toSet();
    }
  }
}
