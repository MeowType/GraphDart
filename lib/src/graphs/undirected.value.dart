part of meowtype.graph;

/// Undirected graph, Can create an edge and value between 2 nodes
abstract class UndirectedValueGraph extends UndirectedGraph
    implements GraphGet {
  factory UndirectedValueGraph() = FullGraph;

  /// create an link between 2 nodes with value
  void set(a, b, key, val, {List tags});

  /// create an link between 2 nodes with value but by Generic
  ///
  /// Equivalent to [set]([a], [b], **[T]**, [val])
  void setBy<T>(a, b, val, {List tags});

  /// Determine if there is a value link between 2 nodes
  bool hasEdge(a, b, key, {List anyTags, List allTags});

  /// Determine if there is a value link between 2 nodes but by Generic
  ///
  /// Equivalent to [hasEdge]([a], [b], **[T]**)
  bool hasEdgeBy<T>(a, b, {List anyTags, List allTags});

  /// Remove the valued link between 2 nodes, but will not remove [a] and [b] and the link between them
  bool unSet(a, b, key, {List anyTags, List allTags});

  /// Remove the valued link between 2 nodes but by Generic, but will not remove [a] and [b] and the link between them
  ///
  /// Equivalent to [unSet]([a], [b], **[T]**)
  bool unSetBy<T>(a, b, {List anyTags, List allTags});

  /// Get all the values on all links of this node
  Iterable values(val, key, {List anyTags, List allTags});

  /// Get all the values on all links of this node but by Generic
  ///
  /// Equivalent to [values]([val], **[T]**)
  Iterable valuesBy<T>(val, {List anyTags, List allTags});
}

/// Mixing of implementations of [UndirectedValueGraph]
mixin UndirectedValueGraphMixin on UndirectedGraphMixin
    implements UndirectedValueGraph, GraphGet {
  void set(a, b, key, val, {List tags = const []}) {
    _Tuple2(a, b)
        .map((v) => _map_add_or_get(v, _newNode))
        .effect
        .mutual((f, t) => f.setFrom(t))
        .mutual((f, t) => f.setToV(t, key, val))
        .mutual((f, t) => f.setValTag(t, key, tags));
  }

  void setBy<T>(a, b, val, {List tags}) => set(a, b, T, val, tags: tags);

  bool hasEdge(a, b, key, {List anyTags = const [], List allTags = const []}) {
    return _Tuple2(a, b)
        .map((v) => _map_add_or_get(v, _newNode))
        .mutual((f, t) => _check_hasToVal_and_all_any_val_tags(f, t, key,
            anyTags: anyTags, allTags: allTags))
        .toDo(_or);
  }

  bool hasEdgeBy<T>(a, b, {List anyTags, List allTags}) =>
      hasEdge(a, b, T, anyTags: anyTags, allTags: allTags);

  bool unSet(a, b, key, {List anyTags = const [], List allTags = const []}) {
    return _Tuple2(a, b)
        .map((v) => _map_add_or_get(v, _newNode))
        .where((t) => t
            .mutual((f, t) => _check_hasToVal_and_all_any_val_tags(f, t, key,
                anyTags: anyTags, allTags: allTags))
            .toDo(_or))
        // unsetToV will delete the tab
        .some((t) => t.mutual((f, t) => f.unsetToV(t, key)).toDo(_or))
        .defaultVal(false)
        .val;
  }

  bool unSetBy<T>(a, b, {List anyTags, List allTags}) =>
      unSet(a, b, T, anyTags: anyTags, allTags: allTags);

  Iterable values(val, key,
      {List anyTags = const [], List allTags = const []}) {
    final _v = _map_add_or_get(val, _newNode);

    final bool Function(Maybe) where =
        anyTags.length == 0 && allTags.length == 0
            ? (m) => m is Some
            : (m) => m is Some
                ? _check_all_any_val_tags(_v, m.val, key,
                    anyTags: anyTags, allTags: allTags)
                : false;

    final a = _v.to.keys.map((n) => _v.get(n, key));
    final b = _v.from.map((n) => n.get(_v, key));
    return _concat(a, b).where(where).map((s) => s.val).toSet();
  }

  Iterable valuesBy<T>(val, {List anyTags, List allTags}) =>
      values(val, T, anyTags: anyTags, allTags: allTags);
}
