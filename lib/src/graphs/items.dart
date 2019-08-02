part of MeowType.Graph;

abstract class GraphItems implements Iterable {
  bool add(val);
  bool has(val);
  bool remove(val);
  Iterable get items;
  int get length;
}

mixin GraphItemsMixin implements GraphItems, Iterable {
  final Map<dynamic, _Node> _map = {};
  final Map<_Node, dynamic> _node_to_val = {};

  _Node _map_add_or_get(key, _Node def()) {
    if (_map.containsKey(key)) return _map[key];
    final val = def();
    _map[key] = val;
    _node_to_val[val] = key;
    return val;
  }

  bool add(val) {
    if (_map.containsKey(val)) {
      return false;
    }
    final node = _Node();
    _map[val] = node;
    _node_to_val[node] = val;
    return true;
  }

  bool has(val) {
    return _map.containsKey(val);
  }

  bool remove(val) {
    if (_map.containsKey(val)) {
      final node = _map[val];
      for (var from in node.from) {
        from.to.remove(node);
      }
      for (var to in node.to.keys) {
        to.from.remove(node);
      }
      _node_to_val.remove(node);
      _map.remove(val);
      return true;
    }
    return false;
  }

  Iterable get items => _map.keys;

  int get length => _map.length;

  Iterator get iterator => items.iterator;

  Iterable<R> flatMap<R>(Iterable<R> f(item)) sync* {
    for (var item in items) {
      yield* f(item);
    }
  }
}
