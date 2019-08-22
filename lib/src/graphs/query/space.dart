part of meowtype.graph;

class _TheSpace {
  const _TheSpace();
}

const NoneSpace = const _TheSpace();

abstract class GraphQuery_Space<T, C extends _IChain> implements _IChain<C> {
  final C _parent;
  final dynamic _space;

  GraphQuery_Space(
    this._parent, [
    this._space = NoneSpace,
  ]);
}

abstract class GraphQuery_Space_AllType<C extends _IChain> implements _IChain<C> {
  final C _parent;
  final dynamic _space;

  GraphQuery_Space_AllType(
    this._parent, [
    this._space = NoneSpace,
  ]);
}

//====================================================================================================

abstract class IGraphQueryGETSpace<C extends _IChain> {
  GraphQuery_Space<T, C> space<T>([space = NoneSpace]);
}

abstract class IGraphQueryGETSpaceAllType<C extends _IChain> {
  GraphQuery_Space_AllType<C> spaceAllType([space = NoneSpace]);
}