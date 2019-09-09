part of meowtype.graph;

class _RawFindBox<T> {
  final T val;
  final dynamic space;
  final _Node node;
  _RawFindBox(this.val, this.space, this.node);
  factory _RawFindBox.FromNode(_Node node) => _RawFindBox(node._val, node._space, node);
}

class _RawFindLinkBox<F, T> {
  final _RawFindBox<F> from;
  final _RawFindBox<T> to;
  final Map<dynamic, Maybe> map;
  _RawFindLinkBox(this.from, this.to, this.map);
}
