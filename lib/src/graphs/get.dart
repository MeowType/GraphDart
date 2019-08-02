part of MeowType.Graph;

abstract class GraphGet implements GraphItems {
  Maybe get(from, to, key);
  Maybe getBy<T>(from, to);
}

mixin GraphGetMixin on GraphItemsMixin {
  Maybe get(from, to, key) {
    final _f = _add_or_get(_map, from, _newNode);
    final _t = _add_or_get(_map, to, _newNode);
    return _f.get(_t, key);
  }

  Maybe getBy<T>(from, to) {
    final _f = _add_or_get(_map, from, _newNode);
    final _t = _add_or_get(_map, to, _newNode);
    return _f.getT<T>(_t);
  }
}
