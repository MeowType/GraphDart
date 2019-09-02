part of meowtype.graph;

Func<_Node> _newNode(val) => () => _Node(val);
Set _newSet() => Set();

class _Node {
  final dynamic _val;

  /// {node}
  final Set<_Node> _from = Set();

  /// space -> {node}
  final Map<dynamic, Set<_Node>> _to = {};

  /// space -> (node -> (type -> val))
  final Map<dynamic, Map<_Node, Map<Type, dynamic>>> _toVal = {};

  _Node(this._val);

  //static _Edge newInnerEdge() => _Edge();

  bool setFrom(_Node node) {
    return _from.add(node);
  }

  bool setTo(_Node node, [space = NoneSpace]) {
    final nset = _add_or_get(_to, space, () => Set<_Node>());
    return nset.add(node);
  }

  @unTypeSafe
  bool setToV(_Node node, val, {space = NoneSpace, type = dynamic}) {
    final nmap = _add_or_get(_toVal, space, () => Map<_Node, Map<Type, dynamic>>());
    final tmap = _add_or_get(nmap, node, () => Map<Type, dynamic>());
    if (tmap.containsKey(type)) return false;
    tmap[type] = val;
    return true;
  }

  @unTypeSafe
  Maybe get(_Node node, {space = NoneSpace, type = dynamic}) {
    final nmap = _try_get(_toVal, space);
    if (nmap is None) return None();
    final tmap = _try_get(nmap.val, node);
    if (tmap is None) return None();
    return _try_get(tmap.val, type);
  }

  bool hasFrom(_Node node) {
    return _from.contains(node);
  }

  bool hasTo(_Node node, [space = NoneSpace]) {
    if (_to.containsKey(space)) {
      return _to[space].contains(node);
    }
    return false;
  }

  bool hasToV(_Node node, {Maybe val = const None(), space = NoneSpace, type = dynamic}) {
    final nmap = _try_get(_toVal, space);
    if (nmap is None) return false;
    final tmap = _try_get(nmap.val, node);
    if (tmap is None) return false;
    if (tmap.val.containsKey(type)) {
      if (val is Some) {
        return tmap.val[type] == val;
      } else {
        return true;
      }
    }
    return false;
  }

  bool unsetFrom(_Node node) {
    return _from.remove(node);
  }

  bool unsetTo(_Node node, [space = NoneSpace]) {
    if (_to.containsKey(space)) {
      return _to[space].remove(node);
    }
    return false;
  }

  bool unsetToV(_Node node, key, {space = NoneSpace, type = dynamic}) {
    final nmap = _try_get(_toVal, space);
    if (nmap is None) return false;
    final tmap = _try_get(nmap.val, node);
    if (tmap is None) return false;
    if (tmap.val.containsKey(type)) {
      tmap.val.remove(type);
      return true;
    }
    return false;
  }
}
