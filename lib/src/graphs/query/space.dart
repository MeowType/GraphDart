part of meowtype.graph;

class _TheSpace {
  const _TheSpace();
}

const NoneSpace = const _TheSpace();

abstract class GraphQuery_Space<T> implements _IChain {
  final dynamic _space;

  GraphQuery_Space([
    this._space = NoneSpace,
  ]);
}

abstract class GraphQuery_Space_AllType implements _IChain {
  final dynamic _space;

  GraphQuery_Space_AllType([
    this._space = NoneSpace,
  ]);
}

//====================================================================================================

abstract class IGraphQueryGETSpace {
  GraphQuery_Space<T> space<T>([space = NoneSpace]);
}

abstract class IGraphQueryGETSpaceAllType {
  GraphQuery_Space_AllType spaceAllType([space = NoneSpace]);
}
