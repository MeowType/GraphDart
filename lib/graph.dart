import 'package:graph_lib/maybe.dart';

V _add_or_get<M extends Map<K, V>, K, V>(M m, K key, V Function() def) {
  if (m.containsKey(key)) return m[key];
  final val = def();
  m[key] = val;
  return val;
}

_Node _newNode() => _Node();

class _Node {
  final Set<_Node> from = Set();

  final Map<_Node, Map<dynamic, Maybe<dynamic>>> to = {};

  static Map<dynamic, Maybe<dynamic>> newInnerMap() =>
      Map<dynamic, Maybe<dynamic>>();

  void setFrom(_Node node) {
    from.add(node);
  }

  void setTo(_Node node) {
    _add_or_get(to, node, () => Map());
  }

  void setToV(_Node node, key, val) {
    final map = _add_or_get(to, node, newInnerMap);
    map[key] = Some(val);
  }

  void setToT<T>(_Node node, val) {
    final map = _add_or_get(to, node, newInnerMap);
    map[T] = Some(val);
  }

  Maybe get(_Node node, key) {
    if (to.containsKey(node)) {
      final map = to[node];
      if (map.containsKey(key)) {
        return map[key];
      }
    }
    return None();
  }

  Maybe getT<T>(_Node node) {
    if (to.containsKey(node)) {
      final map = to[node];
      if (map.containsKey(T)) {
        return map[T];
      }
    }
    return None();
  }

  bool hasFrom(_Node node) {
    return from.contains(node);
  }

  bool hasTo(_Node node) {
    return to.containsKey(node);
  }

  bool hasToV(_Node node, key) {
    if (to.containsKey(node)) {
      final map = to[node];
      return map.containsKey(key);
    }
    return false;
  }

  bool hasToT<T>(_Node node) {
    if (to.containsKey(node)) {
      final map = to[node];
      return map.containsKey(T);
    }
    return false;
  }

  bool unsetFrom(_Node node) {
    return from.remove(node);
  }

  bool unsetTo(_Node node) {
    return to.remove(node) != null;
  }

  bool unsetToV(_Node node, key) {
    if (to.containsKey(node)) {
      final map = to[node];
      return map.remove(key) != null;
    }
    return false;
  }

  bool unsetToT<T>(_Node node) {
    if (to.containsKey(node)) {
      final map = to[node];
      return map.remove(T) != null;
    }
    return false;
  }
}

class Graph {
  final Map<dynamic, _Node> _map = {};

  bool add(value) {
    if (_map.containsKey(value)) {
      return false;
    }
    _map[value] = _Node();
    return true;
  }

  bool has(value) {
    return _map.containsKey(value);
  }

  void link(a, b) {
    final _a = _add_or_get(_map, a, _newNode);
    final _b = _add_or_get(_map, b, _newNode);
    _a.setFrom(b);
    _b.setFrom(a);
    _a.setTo(b);
    _b.setTo(a);
  }

  void set(a, b, key, val) {
    final _a = _add_or_get(_map, a, _newNode);
    final _b = _add_or_get(_map, b, _newNode);
    _a.setFrom(b);
    _b.setFrom(a);
    _a.setToV(b, key, val);
    _b.setToV(a, key, val);
  }

  void setBy<T>(a, b, val) {
    final _a = _add_or_get(_map, a, _newNode);
    final _b = _add_or_get(_map, b, _newNode);
    _a.setFrom(b);
    _b.setFrom(a);
    _a.setToT<T>(b, val);
    _b.setToT<T>(a, val);
  }

  void linkTo(from, to) {
    final _f = _add_or_get(_map, from, _newNode);
    final _t = _add_or_get(_map, to, _newNode);
    _t.setFrom(_f);
    _f.setTo(_t);
  }

  void setTo(from, to, key, val) {
    final _f = _add_or_get(_map, from, _newNode);
    final _t = _add_or_get(_map, to, _newNode);
    _t.setFrom(_f);
    _f.setToV(_t, key, val);
  }

  void setToBy<T>(from, to, val) {
    final _f = _add_or_get(_map, from, _newNode);
    final _t = _add_or_get(_map, to, _newNode);
    _t.setFrom(_f);
    _f.setToT<T>(_t, val);
  }

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

  bool hasLink(a, b) {
    final _a = _add_or_get(_map, a, _newNode);
    final _b = _add_or_get(_map, b, _newNode);
    return _a.hasTo(_b) && _b.hasTo(_a);
  }

  bool hasEdge(a, b, key) {
    final _a = _add_or_get(_map, a, _newNode);
    final _b = _add_or_get(_map, b, _newNode);
    return _a.hasToV(_b, key) && _b.hasToV(_a, key);
  }

  bool hasEdgeBy<T>(a, b) {
    final _a = _add_or_get(_map, a, _newNode);
    final _b = _add_or_get(_map, b, _newNode);
    return _a.hasToT<T>(_b) && _b.hasToT<T>(_a);
  }

  bool hasLinkTo(from, to) {
    final _f = _add_or_get(_map, from, _newNode);
    final _t = _add_or_get(_map, to, _newNode);
    return _f.hasTo(_t);
  }

  bool hasEdgeTo(from, to, key) {
    final _f = _add_or_get(_map, from, _newNode);
    final _t = _add_or_get(_map, to, _newNode);
    return _f.hasToV(_t, key);
  }

  bool hasEdgeToBy<T>(from, to) {
    final _f = _add_or_get(_map, from, _newNode);
    final _t = _add_or_get(_map, to, _newNode);
    return _f.hasToT<T>(_t);
  }

  bool unLink(a, b) {
    final _a = _add_or_get(_map, a, _newNode);
    final _b = _add_or_get(_map, b, _newNode);
    final x = _a.unsetTo(_b);
    final y = _a.unsetFrom(_b);
    final z = _b.unsetTo(_a);
    final w = _b.unsetFrom(_a);
    return x || y || z || w;
  }

  bool unSet(a, b, key) {
    final _a = _add_or_get(_map, a, _newNode);
    final _b = _add_or_get(_map, b, _newNode);

    final ar = _a.unsetToV(_b, key);
    final br = _b.unsetToV(_a, key);
    return ar || br;
  }

  bool unSetBy<T>(a, b) {
    final _a = _add_or_get(_map, a, _newNode);
    final _b = _add_or_get(_map, b, _newNode);

    final ar = _a.unsetToV(_b, T);
    final br = _b.unsetToV(_a, T);
    return ar || br;
  }

  bool unLinkTo(from, to) {
    final _f = _add_or_get(_map, from, _newNode);
    final _t = _add_or_get(_map, to, _newNode);
    final a = _f.unsetTo(_t);
    final b = _t.unsetFrom(_f);
    return a || b;
  }

  bool unSetTo(from, to, key) {
    final _f = _add_or_get(_map, from, _newNode);
    final _t = _add_or_get(_map, to, _newNode);
    return _f.unsetToV(_t, key);
  }

  bool unSetToBy<T>(from, to) {
    final _f = _add_or_get(_map, from, _newNode);
    final _t = _add_or_get(_map, to, _newNode);
    return _f.unsetToV(_t, T);
  }
}
