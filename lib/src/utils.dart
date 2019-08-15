part of meowtype.graph;

V _add_or_get<K, V>(Map<K, V> m, K key, V Function() def) {
  if (m.containsKey(key)) return m[key];
  final val = def();
  m[key] = val;
  return val;
}

Maybe<V> _try_get<K, V>(Map<K, V> m, K key) {
  if (m.containsKey(key)) return Some(m[key]);
  return const None();
}

Iterable<V> _concat<V>(Iterable<V> a, Iterable<V> b) sync* {
  yield* a;
  yield* b;
}

bool _check_all_any_tags(
  _Node from,
  _Node to, {
  List anyTags = const [],
  List allTags = const [],
}) {
  var result = false;
  if (allTags.length != 0 && from.hasTag(to, allTags)) result = true;
  if (anyTags.length != 0 && from.hasTagAny(to, anyTags)) result = true;
  return result;
}

bool _check_hasTo_and_all_any_tags(
  _Node from,
  _Node to, {
  List anyTags = const [],
  List allTags = const [],
}) {
  if (from.hasTo(to)) {
    if (allTags.length == 0 && anyTags.length == 0) return true;
    return _check_all_any_tags(from, to, allTags: allTags, anyTags: anyTags);
  }
  return false;
}


bool _check_all_any_val_tags(
  _Node from,
  _Node to, key, {
  List anyTags = const [],
  List allTags = const [],
}) {
  var result = false;
  if (allTags.length != 0 && from.hasValTag(to, key, allTags)) result = true;
  if (anyTags.length != 0 && from.hasValTagAny(to, key, anyTags)) result = true;
  return result;
}

bool _check_hasToVal_and_all_any_val_tags(
  _Node from,
  _Node to, key, {
  List anyTags = const [],
  List allTags = const [],
}) {
  if (from.hasToV(to, key)) {
    if (allTags.length == 0 && anyTags.length == 0) return true;
    return _check_all_any_val_tags(from, to, key, allTags: allTags, anyTags: anyTags);
  }
  return false;
}
