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

  static _Edge newInnerEdge() => _Edge();

  bool setFrom(_Node node) {
    return from.add(node);
  }

  void setTo(_Node node) {
    _add_or_get(to, node, newInnerEdge);
  }

  void setToV(_Node node, key, val) {
    final edge = _add_or_get(to, node, newInnerEdge);
    edge.map[key] = Some(val);
  }

  void setTag(_Node node, List tags) {
    final edge = _add_or_get(to, node, newInnerEdge);
    edge.tags.addAll(tags);
  }

  void setValTag(_Node node, key, List tags) {
    final edge = _add_or_get(to, node, newInnerEdge);
    final tagset = _add_or_get(edge.valtags, key, _newSet);
    tagset.addAll(tags);
  }

  Maybe get(_Node node, key) {
    if (to.containsKey(node)) {
      final edge = to[node];
      if (edge.map.containsKey(key)) {
        return edge.map[key];
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
      final edge = to[node];
      return edge.map.containsKey(key);
    }
    return false;
  }

  bool hasTag(_Node node, List tags) {
    if (tags.isEmpty) return false;
    final edge = _add_or_get(to, node, newInnerEdge);
    return edge.tags.containsAll(tags);
  }

  bool hasValTag(_Node node, key, List tags) {
    if (tags.isEmpty) return false;
    final edge = _add_or_get(to, node, newInnerEdge);
    if (edge.valtags.containsKey(key)) {
      return edge.valtags[key].containsAll(tags);
    }
    return false;
  }

  bool hasTagAny(_Node node, List tags) {
    if (tags.isEmpty) return false;
    final edge = _add_or_get(to, node, newInnerEdge);
    return tags.any((tag) => edge.tags.contains(tag));
  }

  bool hasValTagAny(_Node node, key, List tags) {
    if (tags.isEmpty) return false;
    final edge = _add_or_get(to, node, newInnerEdge);
    if (edge.valtags.containsKey(key)) {
      return tags.any((tag) => edge.valtags[key].contains(tag));
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
      edge.valtags.remove(key);
      return edge.map.remove(key) != null;
    }
    return false;
  }

  bool unsetTag(_Node node, List tags) {
    final edge = _try_get(to, node);
    if (edge is Some) {
      edge.val.tags.removeAll(tags);
      return true;
    }
    return false;
  }

  bool unsetValTag(_Node node, key, List tags) {
    final edge = _try_get(to, node);
    if (edge is Some) {
      if (edge.val.valtags.containsKey(key)) {
        edge.val.valtags[key].removeAll(tags);
        return true;
      }
    }
    return false;
  }

  bool clearTags(_Node node) {
    final edge = _try_get(to, node);
    if (edge is Some) {
      edge.val.tags.clear();
      return true;
    }
    return false;
  }

  bool clearValTags(_Node node) {
    final edge = _try_get(to, node);
    if (edge is Some) {
      edge.val.valtags.clear();
      return true;
    }
    return false;
  }
}
