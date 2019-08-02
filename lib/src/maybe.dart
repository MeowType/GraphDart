library MeowType.Maybe;

Maybe<T> Some<T>(T val) {
  return Maybe.Some(val);
}

Maybe<T> None<T>() {
  return Maybe.None();
}

class Maybe<T> {
  T _val;
  bool _has;

  Maybe(T val) {
    _val = val;
    _has = true;
  }
  Maybe.Some(T val) {
    _val = val;
    _has = true;
  }
  Maybe.None() {
    _has = false;
  }

  get val => _val;

  get has => _has;

  Maybe<R> when<R>({R Function() some, R Function() none}) {
    if (_has) {
      if (some != null) return Some(some());
    } else {
      if (none != null) return Some(none());
    }
    return None();
  }

  Maybe<R> some<R>(R Function(T val) some) {
    if (_has) {
      if (some != null) return Some(some(_val));
    }
    return None();
  }

  Maybe<R> none<R>(R Function() none) {
    if (!_has) {
      if (none != null) return Some(none());
    }
    return None();
  }

  Maybe<V> defaultVal<V>(V v) {
    if (!_has) {
      return Some(v);
    }
    return None();
  }
}
