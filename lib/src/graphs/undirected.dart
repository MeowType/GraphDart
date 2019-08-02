part of MeowType.Graph;

abstract class UndirectedGraph extends GraphItems {
  factory UndirectedGraph() => FullGraph();
  void link(a, b);
  bool hasLink(a, b);
  bool unLink(a, b);
}

mixin UndirectedGraphMixin on GraphItemsMixin implements UndirectedGraph {
  void link(a, b) {
    final _a = _add_or_get(_map, a, _newNode);
    final _b = _add_or_get(_map, b, _newNode);
    _a.setFrom(b);
    _b.setFrom(a);
    _a.setTo(b);
    _b.setTo(a);
  }

  bool hasLink(a, b) {
    final _a = _add_or_get(_map, a, _newNode);
    final _b = _add_or_get(_map, b, _newNode);
    return _a.hasTo(_b) && _b.hasTo(_a);
  }

  bool unLink(a, b) {
    final _a = _add_or_get(_map, a, _newNode);
    final _b = _add_or_get(_map, b, _newNode);
    final x = _a.unsetTo(_b);
    final y = _a.unsetFrom(_b);
    final z = _b.unsetTo(_a);
    final w = _b.unsetFrom(_a);
    return x || y || z || w;
  }
}
