part of meowtype.graph;

class _Edge {
  final Set tags = Set();
  final Map<dynamic, Maybe<dynamic>> map = Map<dynamic, Maybe<dynamic>>();
  final Map<dynamic, Set> valtags = Map<dynamic, Set>();
}

_Node _newNode() => _Node();
Set _newSet() => Set();

class _Node {
  final Set<_Node> from = Set();

  final Map<_Node, _Edge> to = {};

  static _Edge newInnerMap() => _Edge();

  bool setFrom(_Node node) {
    return from.add(node);
  }

  void setTo(_Node node) {
    _add_or_get(to, node, newInnerMap);
  }

  void setToV(_Node node, key, val) {
    final edge = _add_or_get(to, node, newInnerMap);
    edge.map[key] = Some(val);
  }

  bool setTag(_Node node, tag) {
    final edge = _add_or_get(to, node, newInnerMap);
    return edge.tags.add(tag);
  }

  bool setValTag(_Node node, key, tag) {
    final edge = _add_or_get(to, node, newInnerMap);
    final tagset = _add_or_get(edge.valtags, key, _newSet);
    return tagset.add(tag);
  }

  Maybe get(_Node node, key) {
    if (to.containsKey(node)) {
      final edge = to[node];
      if (edge.map.containsKey(key)) {
        return edge.map[key];
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
      final edge = to[node];
      return edge.map.containsKey(key);
    }
    return false;
  }

  bool hasTag(_Node node, tag) {
    final edge = _add_or_get(to, node, newInnerMap);
    return edge.tags.contains(tag);
  }

  bool hasValTag(_Node node, key, tag) {
    final edge = _add_or_get(to, node, newInnerMap);
    if (edge.valtags.containsKey(key)) {
      return edge.valtags[key].contains(tag);
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
      final edge = to[node];
      return edge.map.remove(key) != null;
    }
    return false;
  }

  bool unsetTag(_Node node, tag) {
    final edge = _add_or_get(to, node, newInnerMap);
    return edge.tags.remove(tag);
  }

  bool unsetValTag(_Node node, key, tag) {
    final edge = _add_or_get(to, node, newInnerMap);
    if (edge.valtags.containsKey(key)) {
      return edge.valtags[key].remove(tag);
    }
    return false;
  }
}
