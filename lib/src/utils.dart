part of meowtype.graph;

class _Tuple2<T> {
  final T a;
  final T b;
  _Tuple2(this.a, this.b);

  /// return `fn(a, b)`
  R toDo<R>(R fn(T a, T b)) => fn(a, b);

  /// `x = toDo(a)` and `y = toDo(b)` then return `Tuple2(x, y)`
  _Tuple2<R> map<R>(R toDo(T v)) => _Tuple2(toDo(a), toDo(b));

  /// `x = toDo(a, b)` and `y = toDo(b, a)` then return `Tuple2(x, y)`
  _Tuple2<R> mutual<R>(R toDo(T f, T t)) => _Tuple2(toDo(a, b), toDo(b, a));

  /// return `Tuple2(Tuple2(a, b), Tuple2(a, b))`
  _Tuple2<_Tuple2<T>> fork() => _Tuple2(this, this);

  /// return `Tuple2(Tuple2(a, a), Tuple2(b, b))`
  _Tuple2<_Tuple2<T>> pack() => _Tuple2(_Tuple2(a, a), _Tuple2(b, b));

  /// `x = doa(a)` and `y = dob(b)` then return `Tuple2(x, y)`
  _Tuple2<R> allDo<R>(R doa(T a), R dob(T b)) => _Tuple2(doa(a), dob(b));

  /// `x = toDo(a)` and `y = toDo(b)` then return `Tuple2(x, y)`
  _FnTuple2<F, R> mapFn<F extends Function, R>(R Function(F) toDo(T v)) =>
      _FnTuple2(toDo(a), toDo(b));

  /// when fn -> true return Some(this) else None
  Maybe<_Tuple2<T>> where(bool fn(_Tuple2<T> t)) =>
      fn(this) ? Some(this) : None();

  /// make effect
  _EffectTuple2<T> get effect => _EffectTuple2(this);
}

class _FnTuple2<F extends Function, R> {
  final R Function(F) a;
  final R Function(F) b;
  _FnTuple2(this.a, this.b);

  _Tuple2<R> allDo(F doa, F dob) => _Tuple2(a(doa), b(dob));
}

class _EffectTuple2<T> {
  final _Tuple2<T> t;
  _EffectTuple2(this.t);

  /// `fn(a, b)`
  _EffectTuple2<T> toDo(fn(T a, T b)) {
    fn(t.a, t.b);
    return this;
  }

  /// `toDo(a)` then `toDo(b)`
  _EffectTuple2<T> map(toDo(T v)) {
    toDo(t.a);
    toDo(t.b);
    return this;
  }

  /// `toDo(a, b)` then `toDo(b, a)`
  _EffectTuple2<T> mutual(toDo(T f, T t)) {
    toDo(t.a, t.b);
    toDo(t.b, t.a);
    return this;
  }

  /// `doa(a)` tjen `dob(b)`
  _EffectTuple2<T> allDo(doa(T a), dob(T b)) {
    doa(t.a);
    dob(t.b);
    return this;
  }

  /// end effect
  _Tuple2<T> get end => t;
}

/// `x = toDo(a, b)` and `y = toDo(b, a)` then return `Tuple2(x, y)`
// _Tuple2<R> _mutual<T, R>(T a, T b, R toDo(T f, T t)) {
//   final r1 = toDo(a, b);
//   final r2 = toDo(b, a);
//   return _Tuple2(r1, r2);
// }

// /// `x = toDo(a, b)` and `y = toDo(b, a)` then return `Tuple2(x, y)`
// _Tuple2<R> _mutualT<T, R>(_Tuple2<T> t, R toDo(T f, T t)) {
//   final r1 = toDo(t.a, t.b);
//   final r2 = toDo(t.b, t.a);
//   return _Tuple2(r1, r2);
// }

/// `a -> b -> a || b`
bool _or(bool a, bool b) => a || b;

/// `a -> b -> a && b`
// bool _and(bool a, bool b) => a && b;

V _add_or_get<K, V>(Map<K, V> m, K key, V Function() def) {
  if (m.containsKey(key)) return m[key];
  final val = def();
  m[key] = val;
  return val;
}

Maybe<V> _try_get<K, V>(Map<K, V> m, K key) {
  if (m.containsKey(key)) return Some(m[key]);
  return None();
}

Iterable<V> _concat<V>(Iterable<V> a, Iterable<V> b) sync* {
  yield* a;
  yield* b;
}

/// return **`false`** when allTags and anyTags are empty
bool _check_all_any_tags(
  _Node from,
  _Node to, {
  List anyTags = const [],
  List allTags = const [],
}) {
  var result = false;
  if (allTags.isNotEmpty && from.hasTag(to, allTags)) result = true;
  if (anyTags.isNotEmpty && from.hasTagAny(to, anyTags)) result = true;
  return result;
}

/// return **`true`** when allTags and anyTags are empty
bool _check_hasTo_and_all_any_tags(
  _Node from,
  _Node to, {
  List anyTags = const [],
  List allTags = const [],
}) {
  if (from.hasTo(to)) {
    if (allTags.isEmpty && anyTags.isEmpty) return true;
    return _check_all_any_tags(from, to, allTags: allTags, anyTags: anyTags);
  }
  return false;
}

/// return **`false`** when allTags and anyTags are empty
bool _check_all_any_val_tags(
  _Node from,
  _Node to,
  key, {
  List anyTags = const [],
  List allTags = const [],
}) {
  var result = false;
  if (allTags.isNotEmpty && from.hasValTag(to, key, allTags)) result = true;
  if (anyTags.isNotEmpty && from.hasValTagAny(to, key, anyTags)) result = true;
  return result;
}

/// return **`true`** when allTags and anyTags are empty
bool _check_hasToVal_and_all_any_val_tags(
  _Node from,
  _Node to,
  key, {
  List anyTags = const [],
  List allTags = const [],
}) {
  if (from.hasToV(to, key)) {
    if (allTags.isEmpty && anyTags.isEmpty) return true;
    return _check_all_any_val_tags(from, to, key,
        allTags: allTags, anyTags: anyTags);
  }
  return false;
}
