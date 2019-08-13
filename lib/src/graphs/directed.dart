part of meowtype.graph;

/// Directed graph, can set the direction of the edge
abstract class DirectedGraph extends GraphItems {
  factory DirectedGraph() = FullGraph;

  /// Link a directed link, if [from] and [to] don't exist, they will be added
  void linkTo(from, to, {List tags});

  /// Determine if there is such a directed link
  bool hasLinkTo(from, to, {List anyTags, List allTags});

  /// Remove a directed link, but will not remove [from] and [to]
  bool unLinkTo(from, to, {List anyTags, List allTags});

  /// Get all links link from [val]
  Iterable linkTos(val, {List anyTags, List allTags});

  /// Get all links link to [val]
  Iterable linkFroms(val, {List anyTags, List allTags});
}

/// Mixing of implementations of [DirectedGraph]
mixin DirectedGraphMixin on GraphItemsMixin implements DirectedGraph {
  void linkTo(from, to, {List tags = const []}) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    _t.setFrom(_f);
    _f.setTo(_t);
    _f.setTag(_t, tags);
  }

  bool hasLinkTo(from, to, {List anyTags = const [], List allTags = const []}) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    return _check_hasTo_and_all_any_tags(_f, _t,
        anyTags: anyTags, allTags: allTags);
  }

  bool unLinkTo(from, to, {List anyTags = const [], List allTags = const []}) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    if (_check_hasTo_and_all_any_tags(_f, _t,
        anyTags: anyTags, allTags: allTags)) {
      final a = _f.unsetTo(_t);
      final b = _t.unsetFrom(_f);
      return a || b;
    }
    return false;
  }

  Iterable linkTos(val, {List anyTags = const [], List allTags = const []}) {
    final _v = _map_add_or_get(val, _newNode);
    if (anyTags.length == 0 && allTags.length == 0)
      return _v.to.keys.map((n) => _node_to_val[n]);
    else
      return _v.to.keys
          .where((n) =>
              _check_all_any_tags(_v, n, anyTags: anyTags, allTags: allTags))
          .map((n) => _node_to_val[n]);
  }

  Iterable linkFroms(val, {List anyTags = const [], List allTags = const []}) {
    final _v = _map_add_or_get(val, _newNode);
    if (anyTags.length == 0 && allTags.length == 0)
      return _v.to.keys.map((n) => _node_to_val[n]);
    else
      return _v.from
          .where((n) =>
              _check_all_any_tags(n, _v, anyTags: anyTags, allTags: allTags))
          .map((n) => _node_to_val[n]);
  }
}
