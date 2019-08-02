part of MeowType.Graph;

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
