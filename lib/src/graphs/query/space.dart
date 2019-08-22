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

//====================================================================================================

abstract class IGraphQueryGETSpace<C extends _IChain> {
  GraphQuery_Space<dynamic, C> space([space = NoneSpace]);

  GraphQuery_Space<T, C> spaceBy<T>([space = NoneSpace]);
}

mixin GraphQueryGETSpaceMixin<Space extends GraphQuery_Space<dynamic, C>, C extends _IChain> implements IGraphQueryGETSpace<C> {
  Space space([space = NoneSpace]) => this.spaceBy<dynamic>(space);
}
