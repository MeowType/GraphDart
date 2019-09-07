part of meowtype.graph;

class _RawFindBox<T> {
  final T val;
  final dynamic space;
  final _Node node;
  _RawFindBox(this.val, this.space, this.node);
}

class _RawFindLinkBox<F> {
  final _RawFindBox<F> from;
  final Map<_Node, Map<dynamic, Maybe>> map;
  _RawFindLinkBox(this.from, this.map);
}