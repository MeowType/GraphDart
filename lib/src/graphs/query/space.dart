part of meowtype.graph;

class _TheSpace {
  const _TheSpace();
}

const NoneSpace = const _TheSpace();

abstract class GraphQuery_Space<T> {
  final dynamic _space;

  GraphQuery_Space([
    this._space = NoneSpace,
  ]);
}

abstract class GraphQuery_Space_AllType {
  final dynamic _space;

  GraphQuery_Space_AllType([
    this._space = NoneSpace,
  ]);
}