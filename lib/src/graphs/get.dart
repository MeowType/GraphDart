part of meowtype.graph;

/// The part used to get the value of the edge in the graph
abstract class GraphGet implements GraphItems {
  /// Get the value on the specified edge
  ///
  /// (Optional) Only if it matches any of [anyTags] and matches all items in [allTags]
  ///
  /// if failed return null
  dynamic get(from, to, key, {List anyTags, List allTags});

  /// Get the value on the specified edge
  ///
  /// (Optional) Only if it matches any of [anyTags] and matches all items in [allTags]
  Maybe tryGet(from, to, key, {List anyTags, List allTags});

  /// Get the value on the specified edge but by Generic
  ///
  /// Equivalent to [get]([from], [to], **[T]**)
  ///
  /// (Optional) Only if it matches any of [anyTags] and matches all items in [allTags]
  Maybe tryGetBy<T>(from, to, {List anyTags, List allTags});
}

/// Mixing of implementations of [GraphGet]
mixin GraphGetMixin on GraphItemsMixin implements GraphGet {
  dynamic get(from, to, key,
          {List anyTags = const [], List allTags = const []}) =>
      tryGet(from, to, key, anyTags: anyTags, allTags: allTags).val;

  Maybe tryGet(from, to, key,
      {List anyTags = const [], List allTags = const []}) {
    final f = _map_add_or_get(from, _newNode);
    final t = _map_add_or_get(to, _newNode);
    if (_check_hasToVal_and_all_any_val_tags(f, t, key,
        anyTags: anyTags, allTags: allTags)) {
      return f.tryGet(t, key);
    }
    return None();
  }

  dynamic getBy<T>(from, to,
          {List anyTags = const [], List allTags = const []}) =>
      get(from, to, T, anyTags: anyTags, allTags: allTags);

  Maybe tryGetBy<T>(from, to,
          {List anyTags = const [], List allTags = const []}) =>
      tryGet(from, to, T, anyTags: anyTags, allTags: allTags);
}
