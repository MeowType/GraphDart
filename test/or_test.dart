import 'package:graph_collection/src/other/Or.dart';
import 'package:test/test.dart';

void main() {
  test('base', () {
    Or<int, bool> l = Or.L(1);
    Or<int, bool> r = Or.R(true);

    expect(l.isL, isTrue);
    expect(l.isR, isFalse);

    expect(r.isL, isFalse);
    expect(r.isR, isTrue);

    expect(l.getL, equals(1));
    expect(l.getR, isNull);

    expect(r.getL, isNull);
    expect(r.getR, isTrue);
  });
}
