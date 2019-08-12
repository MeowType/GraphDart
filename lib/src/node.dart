part of meowtype.graph;

class _Edge {
  Set tags = Set();
  Map<dynamic, Maybe<dynamic>> map = Map<dynamic, Maybe<dynamic>>();
}

_Node _newNode() => _Node();

class _Node {
  final Set<_Node> from = Set();

  final Map<_Node, _Edge> to = {};

  static _Edge newInnerMap() => _Edge();

  void setFrom(_Node node) {
    from.add(node);
  }

  void setTo(_Node node) {
    _add_or_get(to, node, newInnerMap);
  }

  void setToV(_Node node, key, val) {
    final map = _add_or_get(to, node, newInnerMap);
    map.map[key] = Some(val);
  }

  void setToT<T>(_Node node, val) {
    final map = _add_or_get(to, node, newInnerMap);
    map.map[T] = Some(val);
  }

  Maybe get(_Node node, key) {
    if (to.containsKey(node)) {
      final map = to[node];
      if (map.map.containsKey(key)) {
        return map.map[key];
      }
    }
    return const None();
  }

  Maybe getT<T>(_Node node) {
    if (to.containsKey(node)) {
      final map = to[node];
      if (map.map.containsKey(T)) {
        return map.map[T];
      }
    }
    return const None();
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
      return map.map.containsKey(key);
    }
    return false;
  }

  bool hasToT<T>(_Node node) {
    if (to.containsKey(node)) {
      final map = to[node];
      return map.map.containsKey(T);
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
      return map.map.remove(key) != null;
    }
    return false;
  }

  bool unsetToT<T>(_Node node) {
    if (to.containsKey(node)) {
      final map = to[node];
      return map.map.remove(T) != null;
    }
    return false;
  }
}
