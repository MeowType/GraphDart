part of meowtype.graph;

/// Basic graph node collection
abstract class GraphItems implements Iterable {
  /// Add a Node to Graph
  /// 
  /// Return false when there is such a node
  bool add(val);
  /// Determine if there is such a node in graph
  bool has(val);
  /// If there is such a node, remove it
  /// 
  /// Return false when there is no such node
  bool remove(val);
  /// Get all nodes
  Iterable get items;
  /// Get the number of nodes
  int get length;
  /// Get all nodes
  Iterator get iterator;
  /// The [flatMap()] method first maps each element using a mapping function, then flattens the result into a new array
  Iterable<R> flatMap<R>(Iterable<R> f(item));
}

/// Mixing of implementations of [GraphItems]
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
