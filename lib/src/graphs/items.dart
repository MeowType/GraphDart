part of meowtype.graph;

Map<Type, Map<dynamic, _Node>> _create_InnerMap() => Map<Type, Map<dynamic, _Node>>();
Map<dynamic, _Node> _create_InnerMap2() => Map<dynamic, _Node>();

/// Basic graph node collection
abstract class GraphBase implements IGraph {
  /// space -> node -> _Node
  final Map<dynamic, Map<dynamic, _Node>> _map = {};

  base_add.Add get add => base_add.Add(this);
  base_has.Has get has => base_has.Has(this);
  base_remove.Remove get remove => base_remove.Remove(this);

  bool to_add<T>(T node, [space = NoneSpace]) {
    final map = _add_or_get(_add_or_get(_map, space, _create_InnerMap), T, _create_InnerMap2);
    final success = Out<bool>();
    _add_or_get(map, node, _newNode(node), success);
    return success.val;
  }

  bool set_link<A, B>(A nodeA, B nodeB, {spaceA = NoneSpace, spaceB = NoneSpace, spaceLink = NoneSpace}) {}
  bool set_linkTo<F, T>(F from, T to, {spaceFrom = NoneSpace, spaceTo = NoneSpace, spaceLink = NoneSpace}) {}
  bool set_link_with_val<A, B, V>(A nodeA, B nodeB, V val, {spaceA = NoneSpace, spaceB = NoneSpace, spaceLink = NoneSpace}) {}
  bool set_linkTo_with_val<F, T, V>(F from, T to, V val, {spaceFrom = NoneSpace, spaceTo = NoneSpace, spaceLink = NoneSpace}) {}

  bool check_has<T>(T node, [space = NoneSpace]) {
    final smap = _try_get(_map, space);
    if (smap is None) return false;
    if (smap.val.containsKey(node)) {
      return smap.val[node] is T;
    }
    return false;
  }

  bool try_remove<T>(T node, [space = NoneSpace, Out<Maybe<T>> removed_value]) {
    final smap = _try_get(_map, space);
    if (smap is None) return false;
    if (smap.val.containsKey(node) && smap.val[node] is T) {
      final rv = smap.val.remove(node);
      // todo unset link
      trySetValFn(removed_value, () => Some(rv._val));
      return true;
    } else {
      trySetValFn(removed_value, () => None());
      return false;
    }
  }

  /// Return is remove 1 or 1+ item
  bool try_remove_where<T>({Maybe space, Func2<bool, dynamic, dynamic> where, Func1<bool, dynamic> where_space}) {
    var isremoved = false;
    if (where == null) {
      where = (item, _) => item is! T;
    } else {
      final old_where = where;
      where = (item, _n) => !old_where(item, _n) && item is! T;
    }

    bool checkRemove(item, _Node _n) {
      if (where(item, space)) return false;
      // todo unset link
      return true;
    }

    void Function(Map<dynamic, _Node> map) forSmap;
    forSmap = (Map<dynamic, _Node> map) {
      bool Function(dynamic item, _Node _n) mapfn;
      void firstRemoved() {
        isremoved = true;
        mapfn = checkRemove;
        forSmap = (map) => map.removeWhere(checkRemove);
      }

      mapfn = (item, _n) {
        final r = checkRemove(item, _n);
        if (r) firstRemoved();
        return r;
      };

      map.removeWhere((item, _n) => mapfn(item, _n));
    };

    if (space is Some) {
      final smap = _try_get(_map, space.val);
      if (smap is None) return false;
      forSmap(smap.val);
    } else {
      for (var s in where_space == null ? _map.keys : _map.keys.where(where_space)) {
        final smap = _map[s];
        forSmap(smap);
      }
    }
    return isremoved;
  }

  Iterable<FindBoxBy<T>> find_all<T>([Maybe space, Func2<bool, dynamic, dynamic> where, Func1<bool, dynamic> where_space]) sync* {
    if (where == null) {
      where = (item, _) => item is! T;
    } else {
      final old_where = where;
      where = (item, _n) => !old_where(item, _n) && item is! T;
    }

    Iterable<FindBoxBy<T>> forSmap(Map<dynamic, _Node> map, space) sync* {
      for (var item in map.keys) {
        if (where(item, space.val)) continue;
        yield FindBoxBy<T>(item, space);
      }
    }

    if (space is Some) {
      final smap = _try_get(_map, space.val);
      if (smap is None) return;
      yield* forSmap(smap.val, space.val);
    } else {
      for (var s in where_space == null ? _map.keys : _map.keys.where(where_space)) {
        final smap = _map[s];
        yield* forSmap(smap, s);
      }
    }
  }
}
