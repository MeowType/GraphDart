import 'utils.dart';
import 'node.dart';
import 'maybe.dart';

abstract class GraphItems {
  bool add(val);
  bool has(val);
  bool remove(val);
  Iterable get items;
  int get length;
}

mixin GraphItemsMixin implements GraphItems {
  final Map<dynamic, Node> _map = {};

  bool add(val) {
    if (_map.containsKey(val)) {
      return false;
    }
    _map[val] = Node();
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

abstract class UndirectedGraph extends GraphItems {
  factory UndirectedGraph() => FullGraph();
  void link(a, b);
  bool hasLink(a, b);
  bool unLink(a, b);
}

mixin UndirectedGraphMixin on GraphItemsMixin implements UndirectedGraph {
  void link(a, b) {
    final _a = add_or_get(_map, a, newNode);
    final _b = add_or_get(_map, b, newNode);
    _a.setFrom(b);
    _b.setFrom(a);
    _a.setTo(b);
    _b.setTo(a);
  }

  bool hasLink(a, b) {
    final _a = add_or_get(_map, a, newNode);
    final _b = add_or_get(_map, b, newNode);
    return _a.hasTo(_b) && _b.hasTo(_a);
  }

  bool unLink(a, b) {
    final _a = add_or_get(_map, a, newNode);
    final _b = add_or_get(_map, b, newNode);
    final x = _a.unsetTo(_b);
    final y = _a.unsetFrom(_b);
    final z = _b.unsetTo(_a);
    final w = _b.unsetFrom(_a);
    return x || y || z || w;
  }
}

abstract class UndirectedValueGraph extends UndirectedGraph {
  factory UndirectedValueGraph() => FullGraph();
  void set(a, b, key, val);
  void setBy<T>(a, b, val);
  bool hasEdge(a, b, key);
  bool hasEdgeBy<T>(a, b);
  bool unSet(a, b, key);
  bool unSetBy<T>(a, b);
}

mixin UndirectedValueGraphMixin on UndirectedGraphMixin
    implements UndirectedValueGraph, GraphGet {
  void set(a, b, key, val) {
    final _a = add_or_get(_map, a, newNode);
    final _b = add_or_get(_map, b, newNode);
    _a.setFrom(b);
    _b.setFrom(a);
    _a.setToV(b, key, val);
    _b.setToV(a, key, val);
  }

  void setBy<T>(a, b, val) {
    final _a = add_or_get(_map, a, newNode);
    final _b = add_or_get(_map, b, newNode);
    _a.setFrom(b);
    _b.setFrom(a);
    _a.setToT<T>(b, val);
    _b.setToT<T>(a, val);
  }

  bool hasEdge(a, b, key) {
    final _a = add_or_get(_map, a, newNode);
    final _b = add_or_get(_map, b, newNode);
    return _a.hasToV(_b, key) && _b.hasToV(_a, key);
  }

  bool hasEdgeBy<T>(a, b) {
    final _a = add_or_get(_map, a, newNode);
    final _b = add_or_get(_map, b, newNode);
    return _a.hasToT<T>(_b) && _b.hasToT<T>(_a);
  }

  bool unSet(a, b, key) {
    final _a = add_or_get(_map, a, newNode);
    final _b = add_or_get(_map, b, newNode);

    final ar = _a.unsetToV(_b, key);
    final br = _b.unsetToV(_a, key);
    return ar || br;
  }

  bool unSetBy<T>(a, b) {
    final _a = add_or_get(_map, a, newNode);
    final _b = add_or_get(_map, b, newNode);

    final ar = _a.unsetToV(_b, T);
    final br = _b.unsetToV(_a, T);
    return ar || br;
  }
}

abstract class DirectedGraph extends GraphItems {
  factory DirectedGraph() => FullGraph();
  void linkTo(from, to);
  bool hasLinkTo(from, to);
  bool unLinkTo(from, to);
}

mixin DirectedGraphMixin on GraphItemsMixin implements DirectedGraph {
  void linkTo(from, to) {
    final _f = add_or_get(_map, from, newNode);
    final _t = add_or_get(_map, to, newNode);
    _t.setFrom(_f);
    _f.setTo(_t);
  }

  bool hasLinkTo(from, to) {
    final _f = add_or_get(_map, from, newNode);
    final _t = add_or_get(_map, to, newNode);
    return _f.hasTo(_t);
  }

  bool unLinkTo(from, to) {
    final _f = add_or_get(_map, from, newNode);
    final _t = add_or_get(_map, to, newNode);
    final a = _f.unsetTo(_t);
    final b = _t.unsetFrom(_f);
    return a || b;
  }
}

abstract class DirectedValueGraph extends DirectedGraph {
  factory DirectedValueGraph() => FullGraph();
  void setTo(from, to, key, val);
  void setToBy<T>(from, to, val);
  bool hasEdgeTo(from, to, key);
  bool hasEdgeToBy<T>(from, to);
  bool unSetTo(from, to, key);
}

mixin DirectedValueGraphMixin on DirectedGraphMixin
    implements DirectedValueGraph, GraphGet {
  void setTo(from, to, key, val) {
    final _f = add_or_get(_map, from, newNode);
    final _t = add_or_get(_map, to, newNode);
    _t.setFrom(_f);
    _f.setToV(_t, key, val);
  }

  void setToBy<T>(from, to, val) {
    final _f = add_or_get(_map, from, newNode);
    final _t = add_or_get(_map, to, newNode);
    _t.setFrom(_f);
    _f.setToT<T>(_t, val);
  }

  bool hasEdgeTo(from, to, key) {
    final _f = add_or_get(_map, from, newNode);
    final _t = add_or_get(_map, to, newNode);
    return _f.hasToV(_t, key);
  }

  bool hasEdgeToBy<T>(from, to) {
    final _f = add_or_get(_map, from, newNode);
    final _t = add_or_get(_map, to, newNode);
    return _f.hasToT<T>(_t);
  }

  bool unSetTo(from, to, key) {
    final _f = add_or_get(_map, from, newNode);
    final _t = add_or_get(_map, to, newNode);
    return _f.unsetToV(_t, key);
  }

  bool unSetToBy<T>(from, to) {
    final _f = add_or_get(_map, from, newNode);
    final _t = add_or_get(_map, to, newNode);
    return _f.unsetToV(_t, T);
  }
}

abstract class GraphGet implements GraphItems {
  Maybe get(from, to, key);
  Maybe getBy<T>(from, to);
}

mixin GraphGetMixin on GraphItemsMixin {
  Maybe get(from, to, key) {
    final _f = add_or_get(_map, from, newNode);
    final _t = add_or_get(_map, to, newNode);
    return _f.get(_t, key);
  }

  Maybe getBy<T>(from, to) {
    final _f = add_or_get(_map, from, newNode);
    final _t = add_or_get(_map, to, newNode);
    return _f.getT<T>(_t);
  }
}

abstract class LinkGraph implements UndirectedGraph, DirectedGraph {
  factory LinkGraph() => FullGraph();
}

abstract class Graph extends LinkGraph
    implements UndirectedValueGraph, DirectedValueGraph {
  factory Graph() => FullGraph();
}

class FullGraph
    with
        GraphItemsMixin,
        UndirectedGraphMixin,
        UndirectedValueGraphMixin,
        DirectedGraphMixin,
        DirectedValueGraphMixin,
        GraphGetMixin
    implements Graph {}
