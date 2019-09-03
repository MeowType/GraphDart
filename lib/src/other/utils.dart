typedef Action = void Function();
typedef Action1<A> = void Function(A a);
typedef Action2<A, B> = void Function(A a, B b);
typedef Action3<A, B, C> = void Function(A a, B b, C c);

typedef Action1O<A> = void Function([A a]);
typedef Action2O<A, B> = void Function([A a, B b]);
typedef Action2O1<A, B> = void Function(A a, [B b]);
typedef Action3O<A, B, C> = void Function([A a, B b, C c]);
typedef Action3O2<A, B, C> = void Function(A a, [B b, C c]);
typedef Action3O1<A, B, C> = void Function(A a, B b, [C c]);

typedef Func<R> = R Function();
typedef Func1<R, A> = R Function(A a);
typedef Func2<R, A, B> = R Function(A a, B b);
typedef Func3<R, A, B, C> = R Function(A a, B b, C c);

typedef Func1O<R, A> = R Function([A a]);
typedef Func2O<R, A, B> = R Function([A a, B b]);
typedef Func2O1<R, A, B> = R Function(A a, [B b]);
typedef Func3O<R, A, B, C> = R Function([A a, B b, C c]);
typedef Func3O2<R, A, B, C> = R Function(A a, [B b, C c]);
typedef Func3O1<R, A, B, C> = R Function(A a, B b, [C c]);

bool any_to_true(_) => true;

bool when_any_eq<T>(Iterable<T> iter, T val) {
  for (var item in iter) {
    if (item == val) return true;
  }
  return false;
}

bool when_all_eq<T>(Iterable<T> iter, T val) {
  for (var item in iter) {
    if (item != val) return false;
  }
  return true;
}

class UnTypeSafe {
  const UnTypeSafe();
}

const UnTypeSafe unTypeSafe = const UnTypeSafe();