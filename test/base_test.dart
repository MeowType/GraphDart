import 'package:test/test.dart';

import 'package:graph_lib/graph.dart';

void main() {
  test('create', () {
    Graph();
  });

  test('add', () {
    final g = Graph();
    g.add(1);
    g.add('x');

    expect(g.length, equals(2));
  });
}
