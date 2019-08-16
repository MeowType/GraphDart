part of meowtype.graph;

/// Directed graph, but can set the direction of the edge and the value of the edge
abstract class DirectedValueGraph extends DirectedGraph implements GraphGet {
  factory DirectedValueGraph() = FullGraph;

  /// Link a directed link with value, if [from] and [to] don't exist, they will be added
  ///  
  /// Optional [tags] for setting tags
  void setTo(from, to, key, val, {List tags});

  /// Link a directed link with value but by Generic, if [from] and [to] don't exist, they will be added
  ///
  /// Equivalent to [setTo]([from], [to], **[T]**, [val])
  /// 
  /// Optional [tags] for setting tags
  void setToBy<T>(from, to, val, {List tags});

  /// Determine if there is such a valued directed link
  /// 
  /// (Optional) Only if it matches any of [anyTags] and matches all items in [allTags]
  bool hasEdgeTo(from, to, key, {List anyTags, List allTags});

  /// Determine if there is such a valued directed link but by Generic
  ///
  /// Equivalent to [hasEdgeTo]([from], [to], **[T]**)
  /// 
  /// (Optional) Only if it matches any of [anyTags] and matches all items in [allTags]
  bool hasEdgeToBy<T>(from, to, {List anyTags, List allTags});

  /// Remove a valued directed link, but will not remove [from] and [to]
  /// 
  /// (Optional) Only if it matches any of [anyTags] and matches all items in [allTags]
  bool unSetTo(from, to, key, {List anyTags, List allTags});

  /// Remove a valued directed link but by Generic, but will not remove [from] and [to]
  ///
  /// Equivalent to [unSetTo]([from], [to], **[T]**)
  /// 
  /// (Optional) Only if it matches any of [anyTags] and matches all items in [allTags]
  bool unSetToBy<T>(from, to, {List anyTags, List allTags});

  /// Get all values link from [val]
  /// 
  /// (Optional) Only if it matches any of [anyTags] and matches all items in [allTags]
  Iterable valueTos(val, key, {List anyTags, List allTags});

  /// Get all values link to [val]
  /// 
  /// (Optional) Only if it matches any of [anyTags] and matches all items in [allTags]
  Iterable valueFroms(val, key, {List anyTags, List allTags});

  /// Get all values link from [val] but by Generic
  ///
  /// Equivalent to [valueTos]([val], **[T]**)
  /// 
  /// (Optional) Only if it matches any of [anyTags] and matches all items in [allTags]
  Iterable valueTosBy<T>(val, {List anyTags, List allTags});

  /// Get all values link to [val] but by Generic
  ///
  /// Equivalent to [valueFroms]([val], **[T]**)
  /// 
  /// (Optional) Only if it matches any of [anyTags] and matches all items in [allTags]
  Iterable valueFromsBy<T>(val, {List anyTags, List allTags});
}

/// Mixing of implementations of [DirectedValueGraph]
mixin DirectedValueGraphMixin on DirectedGraphMixin
    implements DirectedValueGraph, GraphGet {
  void setTo(from, to, key, val, {List tags = const []}) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    _t.setFrom(_f);
    _f.setToV(_t, key, val);
    _f.setValTag(_t, key, tags);
  }

  void setToBy<T>(from, to, val, {List tags = const []}) =>
      setTo(from, to, T, val, tags: tags);

  bool hasEdgeTo(from, to, key,
      {List anyTags = const [], List allTags = const []}) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    return _check_hasToVal_and_all_any_val_tags(_f, _t, key,
        anyTags: anyTags, allTags: allTags);
  }

  bool hasEdgeToBy<T>(from, to,
          {List anyTags = const [], List allTags = const []}) =>
      hasEdgeTo(from, to, T, anyTags: anyTags, allTags: allTags);

  bool unSetTo(from, to, key,
      {List anyTags = const [], List allTags = const []}) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    if (_check_hasToVal_and_all_any_val_tags(_f, _t, key,
        anyTags: anyTags, allTags: allTags)) {
      // unsetToV will delete the tab
      return _f.unsetToV(_t, key);
    }
    return false;
  }

  bool unSetToBy<T>(from, to,
          {List anyTags = const [], List allTags = const []}) =>
      unSetTo(from, to, T, anyTags: anyTags, allTags: allTags);

  Iterable valueTos(val, key,
      {List anyTags = const [], List allTags = const []}) {
    final _v = _map_add_or_get(val, _newNode);

    final bool Function(Maybe) where =
        anyTags.length == 0 && allTags.length == 0
            ? (m) => m is Some
            : (m) => m is Some
                ? _check_all_any_val_tags(_v, m.val, key,
                    anyTags: anyTags, allTags: allTags)
                : false;

    return _v.to.keys.map((n) => _v.get(n, key)).where(where).map((s) => s.val);
  }

  Iterable valueFroms(val, key,
      {List anyTags = const [], List allTags = const []}) {
    final _v = _map_add_or_get(val, _newNode);

    final bool Function(Maybe) where =
        anyTags.length == 0 && allTags.length == 0
            ? (m) => m is Some
            : (m) => m is Some
                ? _check_all_any_val_tags(_v, m.val, key,
                    anyTags: anyTags, allTags: allTags)
                : false;

    return _v.from.map((n) => n.get(_v, key)).where(where).map((s) => s.val);
  }

  Iterable valueTosBy<T>(val,
          {List anyTags = const [], List allTags = const []}) =>
      valueTos(val, T, anyTags: anyTags, allTags: allTags);

  Iterable valueFromsBy<T>(val,
          {List anyTags = const [], List allTags = const []}) =>
      valueFroms(val, T, anyTags: anyTags, allTags: allTags);
}
