import "package:test/test.dart";

import 'package:graph_lib/maybe.dart';

void main() {
  test('create Some', () {
    final some = Some(1);

    expect(some.has, isTrue);
    expect(some.val, equals(1));
  });

  test('create None', () {
    final none = None();

    expect(none.has, isFalse);
    expect(none.val, isNull);
  });

  test('when some', () {
    final some = Some(1);

    final when = some.when(some: (v) => true, none: () => false);

    expect(when.has, isTrue);
    expect(when.val, isTrue);
  });

  test('when none', () {
    final none = None();

    final when = none.when(some: (v) => true, none: () => false);

    expect(when.has, isTrue);
    expect(when.val, isFalse);
  });

  test('some', () {
    final some = Some(1);

    final when = some.some((v) => true);

    expect(when.has, isTrue);
    expect(when.val, isTrue);
  });

  test('none', () {
    final none = None();

    final when = none.none(() => false);

    expect(when.has, isTrue);
    expect(when.val, isFalse);
  });

  test('defaultVal', () {
    final none = None();

    final when = none.defaultVal(true);

    expect(when.has, isTrue);
    expect(when.val, isTrue);
  });

  test('defaultValFn', () {
    final none = None();

    final when = none.defaultValFn(() => true);

    expect(when.has, isTrue);
    expect(when.val, isTrue);
  });
}
