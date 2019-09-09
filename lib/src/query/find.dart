part of meowtype.graph.query;

class FindBox<T> {
  final T node;
  final dynamic space;
  FindBox(this.node, this.space);
}

enum LinkDirection { Mutual, ToRight, ToLeft }

class FindLinkBox<F, T> {
  final F from;
  final dynamic fromSpace;
  final T to;
  final dynamic toSpace;
  final dynamic linkSpace;

  FindLinkBox(this.from, this.fromSpace, this.to, this.toSpace, this.linkSpace);
}

class FindLinkValBox<F, T, V> extends FindLinkBox<F, T> {
  final V val;

  FindLinkValBox(F from, fromSpace, T to, toSpace, linkSpace, this.val) : super(from, fromSpace, to, toSpace, linkSpace);
}
