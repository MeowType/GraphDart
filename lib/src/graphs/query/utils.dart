part of meowtype.graph;

abstract class _IChain {
  get _parent;
}

typedef Action = void Function();
typedef Action1<A> = void Function(A);
typedef Action2<A, B> = void Function(A, B);
typedef Action3<A, B, C> = void Function(A, B, C);

typedef Action1O<A> = void Function([A]);
typedef Action2O<A, B> = void Function([A, B]);
typedef Action2O1<A, B> = void Function(A, [B]);
typedef Action3O<A, B, C> = void Function([A, B, C]);
typedef Action3O2<A, B, C> = void Function(A, [B, C]);
typedef Action3O1<A, B, C> = void Function(A, B, [C]);

typedef Func<R> = R Function();
typedef Func1<R, A> = R Function(A);
typedef Func2<R, A, B> = R Function(A, B);
typedef Func3<R, A, B, C> = R Function(A, B, C);

typedef Func1O<R, A> = R Function([A]);
typedef Func2O<R, A, B> = R Function([A, B]);
typedef Func2O1<R, A, B> = R Function(A, [B]);
typedef Func3O<R, A, B, C> = R Function([A, B, C]);
typedef Func3O2<R, A, B, C> = R Function(A, [B, C]);
typedef Func3O1<R, A, B, C> = R Function(A, B, [C]);

bool _any_to_true(_) => true;
