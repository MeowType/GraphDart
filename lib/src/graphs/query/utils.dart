part of meowtype.graph;

abstract class _IChain<P extends _IChain<dynamic>> {
  final P _parent;
  _IChain(this._parent);
}