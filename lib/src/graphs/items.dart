part of MeowType.Graph;

abstract class GraphItems {
  bool add(val);
  bool has(val);
  bool remove(val);
  Iterable get items;
  int get length;
}

mixin GraphItemsMixin implements GraphItems {
  final Map<dynamic, _Node> _map = {};

  bool add(val) {
    if (_map.containsKey(val)) {
      return false;
    }
    _map[val] = _Node();
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
      _map.remove(val);
      return true;
    }
    return false;
  }

  Iterable get items => _map.keys;

  int get length => _map.length;
}
