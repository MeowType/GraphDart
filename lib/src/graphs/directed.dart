part of MeowType.Graph;

abstract class DirectedGraph extends GraphItems {
  factory DirectedGraph() => FullGraph();
  void linkTo(from, to);
  bool hasLinkTo(from, to);
  bool unLinkTo(from, to);
}

mixin DirectedGraphMixin on GraphItemsMixin implements DirectedGraph {
  void linkTo(from, to) {
    final _f = _add_or_get(_map, from, _newNode);
    final _t = _add_or_get(_map, to, _newNode);
    _t.setFrom(_f);
    _f.setTo(_t);
  }

  bool hasLinkTo(from, to) {
    final _f = _add_or_get(_map, from, _newNode);
    final _t = _add_or_get(_map, to, _newNode);
    return _f.hasTo(_t);
  }

  bool unLinkTo(from, to) {
    final _f = _add_or_get(_map, from, _newNode);
    final _t = _add_or_get(_map, to, _newNode);
    final a = _f.unsetTo(_t);
    final b = _t.unsetFrom(_f);
    return a || b;
  }
}
