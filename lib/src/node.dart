part of meowtype.graph;

class _Node {
  final dynamic _val;
  final dynamic _space;

  /// {node}
  final Set<_Node> _from = Set();

  /// node -> space -> value?
  final Map<_Node, Map<dynamic, Maybe>> _to = {};

  _Node(this._val, this._space);

  //static _Edge newInnerEdge() => _Edge();

  bool setFrom(_Node node) {
    return _from.add(node);
  }

  bool setTo(_Node node, [space = NoneSpace]) {
    if (_to.containsKey(node)) {
      if (_to[node].containsKey(space)) return false;
      _to[node][space] = const None();
    } else {
      _to[node] = {space: const None()};
    }
    return true;
  }

  bool setToV<T>(_Node node, T val, [space = NoneSpace]) {
    if (_to.containsKey(node)) {
      if (_to[node].containsKey(space) && _to[node][space] is Some && _to[node][space].val == val) return false;
      _to[node][space] = Some(val);
    } else {
      _to[node] = {space: Some(val)};
    }
    return true;
  }

  Maybe<T> get<T>(_Node node, [space = NoneSpace]) {
    if (!_to.containsKey(node) || !_to[node].containsKey(space) || _to[node][space] is! Some || _to[node][space].val is! T) return None();
    return Some(_to[node][space].val);
  }

  bool hasFrom(_Node node) {
    return _from.contains(node);
  }

  bool hasTo(_Node node, [space = NoneSpace]) {
    if (_to.containsKey(node)) {
      return _to[node].containsKey(space);
    }
    return false;
  }

  bool hasToV<T>(_Node node, T val, [space = NoneSpace]) {
    return _to.containsKey(node) && _to[node].containsKey(space) && _to[node][space] is Some && _to[node][space].val == val;
  }

  bool unsetFrom(_Node node) {
    return _from.remove(node);
  }

  bool unsetTo(_Node node) {
    if (_to.containsKey(node)) {
      _to.remove(node);
      return true;
    }
    return false;
  }

  bool unsetToS(_Node node, [space = NoneSpace]) {
    if (_to.containsKey(node) && _to[node].containsKey(space)) {
      _to[node].remove(space);
      return true;
    }
    return false;
  }

  bool unsetToV<T>(_Node node, [space = NoneSpace]) {
    if (_to.containsKey(node) && _to[node].containsKey(space) && _to[node][space] is Some && _to[node][space].val is T) {
      _to[node][space] = const None();
      return true;
    }
    return false;
  }
}
