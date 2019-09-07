part of meowtype.graph.query;

class _TheSpace {
  const _TheSpace();
}

const NoneSpace = const _TheSpace();


abstract class Space_Or_SpaceWhere = Or<dynamic, Func1<bool, dynamic>> with ToAlias;