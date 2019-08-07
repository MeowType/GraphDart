import 'package:test/test.dart';

import 'package:graph_lib/graph.dart';

void main() {
  test('create', () {
    Graph();
  });

  test('[base] add has remove', () {
    final g = Graph();
    g.add(1);
    g.add('x');

    expect(g, hasLength(2));
    expect(g.has(1), isTrue);
    expect(g.has('x'), isTrue);

    expect(g.remove(1), isTrue);
    expect(g.remove(1), isFalse);
    expect(g, hasLength(1));
    expect(g.has(1), isFalse);
  });

  test('[link] add has remove', () {
    final g = Graph();

    g.link(1, 2);

    expect(g, hasLength(2));
    expect(g.has(1), isTrue);
    expect(g.has(2), isTrue);

    expect(g.hasLink(1, 2), isTrue);
    expect(g.hasLink(2, 1), isTrue);

    expect(g.links(1), contains(2));
    expect(g.links(2), contains(1));

    expect(g.links(1), hasLength(1));
    expect(g.links(2), hasLength(1));

    expect(g.unLink(1, 2), isTrue);
    expect(g.unLink(1, 2), isFalse);

    expect(g, hasLength(2));
    expect(g.has(1), isTrue);
    expect(g.has(2), isTrue);
  });

  test('[link to] add has remove', () {
    final g = Graph();

    g.linkTo(1, 2);

    expect(g, hasLength(2));
    expect(g.has(1), isTrue);
    expect(g.has(2), isTrue);

    expect(g.hasLinkTo(1, 2), isTrue);
    expect(g.hasLinkTo(2, 1), isFalse);
    expect(g.hasLink(1, 2), isFalse);

    expect(g.links(1), contains(2));
    expect(g.links(2), contains(1));

    expect(g.links(1), hasLength(1));
    expect(g.links(2), hasLength(1));

    expect(g.linkTos(1), contains(2));
    expect(g.linkTos(1), hasLength(1));
    expect(g.linkTos(2), hasLength(0));

    expect(g.linkFroms(2), contains(1));
    expect(g.linkFroms(2), hasLength(1));
    expect(g.linkFroms(1), hasLength(0));

    expect(g.unLinkTo(1, 2), isTrue);
    expect(g.unLinkTo(1, 2), isFalse);

    expect(g, hasLength(2));
    expect(g.has(1), isTrue);
    expect(g.has(2), isTrue);
  });

  test('[set] add has remove get set', () {
    final g = Graph();

    g.set(1, 2, 3, 4);
    g.setBy<int>(1, 2, 3);

    expect(g, hasLength(2));
    expect(g.has(1), isTrue);
    expect(g.has(2), isTrue);

    expect(g.hasLink(1, 2), isTrue);
    expect(g.hasLink(2, 1), isTrue);

    expect(g.links(1), contains(2));
    expect(g.links(2), contains(1));

    expect(g.links(1), hasLength(1));
    expect(g.links(2), hasLength(1));

    expect(g.hasEdge(1, 2, 3), isTrue);
    expect(g.hasEdgeBy<int>(1, 2), isTrue);

    expect(g.values(1, 3), contains(4));
    expect(g.valuesBy<int>(1), contains(3));

    expect(g.values(1, 3), hasLength(1));
    expect(g.valuesBy<int>(1), hasLength(1));

    expect(g.get(1, 2, 3).has, isTrue);
    expect(g.getBy<int>(1, 2).has, isTrue);

    expect(g.get(1, 2, 3).val, equals(4));
    expect(g.getBy<int>(1, 2).val, equals(3));

    expect(g.unSet(1, 2, 3), isTrue);
    expect(g.unSet(1, 2, 3), isFalse);

    expect(g.unSetBy<int>(1, 2), isTrue);
    expect(g.unSetBy<int>(1, 2), isFalse);

    expect(g.hasEdge(1, 2, 3), isFalse);
    expect(g.hasEdgeBy<int>(1, 2), isFalse);

    expect(g, hasLength(2));
    expect(g.has(1), isTrue);
    expect(g.has(2), isTrue);
  });

  test('[set to] add has remove', () {
    final g = Graph();

    g.setTo(1, 2, 3, 4);
    g.setToBy<int>(1, 2, 3);

    expect(g, hasLength(2));
    expect(g.has(1), isTrue);
    expect(g.has(2), isTrue);

    expect(g.hasLink(1, 2), isFalse);
    expect(g.hasLink(2, 1), isFalse);

    expect(g.hasLinkTo(1, 2), isTrue);
    expect(g.hasLinkTo(2, 1), isFalse);

    expect(g.links(1), contains(2));
    expect(g.links(2), contains(1));

    expect(g.links(1), hasLength(1));
    expect(g.links(2), hasLength(1));

    expect(g.hasEdgeTo(1, 2, 3), isTrue);
    expect(g.hasEdgeToBy<int>(1, 2), isTrue);

    expect(g.values(1, 3), contains(4));
    expect(g.valuesBy<int>(1), contains(3));

    expect(g.values(1, 3), hasLength(1));
    expect(g.valuesBy<int>(1), hasLength(1));

    expect(g.valueTos(1, 3), contains(4));
    expect(g.valueTosBy<int>(1), contains(3));

    expect(g.valueTos(1, 3), hasLength(1));
    expect(g.valueTosBy<int>(1), hasLength(1));

    expect(g.get(1, 2, 3).has, isTrue);
    expect(g.getBy<int>(1, 2).has, isTrue);

    expect(g.get(1, 2, 3).val, equals(4));
    expect(g.getBy<int>(1, 2).val, equals(3));

    expect(g.unSetTo(1, 2, 3), isTrue);
    expect(g.unSetTo(1, 2, 3), isFalse);

    expect(g.unSetToBy<int>(1, 2), isTrue);
    expect(g.unSetToBy<int>(1, 2), isFalse);

    expect(g.hasEdgeTo(1, 2, 3), isFalse);
    expect(g.hasEdgeToBy<int>(1, 2), isFalse);

    expect(g, hasLength(2));
    expect(g.has(1), isTrue);
    expect(g.has(2), isTrue);
  });

  test('types', () {
    dynamic g = Graph();
    LinkGraph lg = g;
    UndirectedGraph ug = g;
    UndirectedValueGraph uvg = g;
    DirectedGraph dg = g;
    DirectedValueGraph dvg = g;
    lg;
    ug;
    uvg;
    dg;
    dvg;
  });
}
