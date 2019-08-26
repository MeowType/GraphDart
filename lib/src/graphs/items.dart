part of meowtype.graph;

Map<Type, Map<dynamic, _Node>> _create_InnerMap() => Map<Type, Map<dynamic, _Node>>();
Map<dynamic, _Node> _create_InnerMap2() => Map<dynamic, _Node>();

/// Basic graph node collection
abstract class GraphBase implements IGraph {
  final Map<dynamic, Map<Type, Map<dynamic, _Node>>> _map = {};

  base_add.Add get add => base_add.Add(this);
  base_has.Has get has => base_has.Has(this);
  base_remove.Remove get remove => base_remove.Remove(this);

  bool to_add<T>(T node, [space = NoneSpace]) {
    final map = _add_or_get(_add_or_get(_map, space, _create_InnerMap), T, _create_InnerMap2);
    final success = Out<bool>();
    _add_or_get(map, node, _newNode(node), success);
    return success.val;
  }

  bool check_has<T>(T node, [space = NoneSpace]) => check_has_AnyType(T, node, space);
  @unTypeSafe
  bool check_has_AnyType(Type type, node, [space = NoneSpace]) {
    final smap = _try_get(_map, space);
    if (smap is None) return false;
    final tmap = _try_get(smap.val, type);
    if (tmap is None) return false;
    return tmap.val.containsKey(node);
  }

  bool try_remove<T>(T node, [space = NoneSpace, Out<Maybe<T>> removed_value]) => try_remove_AnyType(T, node, space, removed_value);
  @unTypeSafe
  bool try_remove_AnyType(Type type, node, [space = NoneSpace, Out<Maybe> removed_value]) {
    final smap = _try_get(_map, space);
    if (smap is None) return false;
    final tmap = _try_get(smap.val, type);
    if (tmap is None) return false;
    final r = tmap.val.containsKey(node);
    if (r) {
      final rv = tmap.val.remove(node);
      // todo unset link
      trySetValFn(removed_value, () => Some(rv.val));
    } else
      trySetValFn(removed_value, () => None());
    return r;
  }

  /// Return is remove 1 or 1+ item
  bool try_remove_whereBy<T>([Maybe space, Func2<bool, dynamic, dynamic> where, Func1<bool, dynamic> where_space]) {
    var isremoved = false;
    if (space is Some) {
      final smap = _try_get(_map, space.val);
      if (smap is None) return false;
      final tmap = _try_get(smap.val, T);
      if (tmap is None) return false;
      if (where == null) {
        isremoved = true;
        // for (var item in tmap.val.keys) {
        //   // todo unset link
        // }
        tmap.val.clear();
      } else {
        tmap.val.removeWhere((item, _n) {
          if (!where(item, space.val)) return false;
          isremoved = true;
          // todo unset link
          return true;
        });
      }
    } else {
      for (var s in where_space == null ? _map.keys : _map.keys.where(where_space)) {
        final smap = _map[s];
        final tmap = _try_get(smap, T);
        if (tmap is None) return false;
        if (where == null) {
          isremoved = true;
          // for (var item in tmap.val.keys) {
          //   // todo unset link
          // }
          tmap.val.clear();
        } else {
          tmap.val.removeWhere((item, _n) {
            if (!where(item, s)) return false;
            isremoved = true;
            // todo unset link
            return true;
          });
        }
      }
    }
    return isremoved;
  }

  bool try_remove_where([Maybe space, Func3<bool, dynamic, dynamic, Type> where, Func1<bool, dynamic> where_space, Func1<bool, Type> where_type]) {
    var isremoved = false;
    if (space is Some) {
      final smap = _try_get(_map, space.val);
      if (smap is None) return false;
      for (var type in smap.val.keys) {
        final tmap = smap.val[type];
        if (where == null) {
          isremoved = true;
          // for (var item in tmap.keys) {
          //   // todo unset link
          // }
          tmap.clear();
        } else {
          tmap.removeWhere((item, _n) {
            if (!where(item, space.val, type)) return false;
            isremoved = true;
            // todo unset link
            return true;
          });
        }
      }
    } else {
      for (var space in where_space == null ? _map.keys : _map.keys.where(where_space)) {
        final smap = _map[space];
        for (var type in where_type == null ? smap.keys : smap.keys.where(where_type)) {
          final tmap = smap[type];
          if (where == null) {
            isremoved = true;
            // for (var item in tmap.keys) {
            //   // todo unset link
            // }
            tmap.clear();
          } else {
            tmap.removeWhere((item, _n) {
              if (!where(item, space, type)) return false;
              isremoved = true;
              // todo unset link
              return true;
            });
          }
        }
      }
    }
    return isremoved;
  }

  Iterable<FindBoxBy<T>> find_allBy<T>([Maybe space, Func2<bool, dynamic, dynamic> where, Func1<bool, dynamic> where_space]) sync* {
    if (space is Some) {
      final smap = _try_get(_map, space.val);
      if (smap is None) return;
      final tmap = _try_get(smap.val, T);
      if (tmap is None) return;
      if (where == null) {
        for (var item in tmap.val.keys) {
          yield FindBoxBy<T>(item, space.val);
        }
      } else {
        for (var item in tmap.val.keys) {
          if (!where(item, space.val)) continue;
          yield FindBoxBy<T>(item, space.val);
        }
      }
    } else {
      for (var s in where_space == null ? _map.keys : _map.keys.where(where_space)) {
        final smap = _map[s];
        final tmap = _try_get(smap, T);
        if (tmap is None) return;
        if (where == null) {
          for (var item in tmap.val.keys) {
            yield FindBoxBy<T>(item, s);
          }
        } else {
          for (var item in tmap.val.keys) {
            if (!where(item, s)) continue;
            yield FindBoxBy<T>(item, s);
          }
        }
      }
    }
  }

  Iterable<FindBox> find_all([Maybe space, Func3<bool, dynamic, dynamic, Type> where, Func1<bool, dynamic> where_space, Func1<bool, Type> where_type]) sync* {
    if (space is Some) {
      final smap = _try_get(_map, space.val);
      if (smap is None) return;
      for (var type in smap.val.keys) {
        final tmap = smap.val[type];
        if (where == null) {
          for (var item in tmap.keys) {
            yield FindBox(item, space.val, type);
          }
        } else {
          for (var item in tmap.keys) {
            if (!where(item, space.val, type)) continue;
            yield FindBox(item, space.val, type);
          }
        }
      }
    } else {
      for (var space in where_space == null ? _map.keys : _map.keys.where(where_space)) {
        final smap = _map[space];
        for (var type in where_type == null ? smap.keys : smap.keys.where(where_type)) {
          final tmap = smap[type];
          if (where == null) {
            for (var item in tmap.keys) {
              yield FindBox(item, space, type);
            }
          } else {
            for (var item in tmap.keys) {
              if (!where(item, space, type)) continue;
              yield FindBox(item, space, type);
            }
          }
        }
      }
    }
  }
}

// //====================================================================================================

// class GraphQuery_Add extends GraphQuery with GraphQueryGETNodeMixin<GraphQuery_Add_Node> {
//   GraphQuery_Add(IGraph graph) : super(graph);

//   GraphQuery_Add_Node<T> nodeBy<T>(T node, [space = NoneSpace]) => GraphQuery_Add_Node<T>(this, node, space);
// }

// //====================================================================================================

// class GraphQuery_Add_Node<T> extends GraphQuery_Node<T> implements IGraphQueryGETLink {
//   final GraphQuery _query;
//   GraphQuery_Add_Node(this._query, T node, [space = NoneSpace]) : super(node, space);

//   GraphQuery_Add_Link<L> link<L>({space = NoneSpace, Maybe<L> value}) => GraphQuery_Add_Link(space, value);
//   GraphQuery_Add_LinkTo<L> linkTo<L>({space = NoneSpace, Maybe<L> value}) => GraphQuery_Add_LinkTo(space, value);
// }

// class GraphQuery_Add_Node_End<T> extends GraphQuery_Node<T> {
//   final IGraphQuery_Link _link;
//   GraphQuery_Add_Node_End(this._link, T node, [space = NoneSpace]) : super(node, space);
// }

// //====================================================================================================

// mixin IGraphQuery_Add_Link on GraphQueryGETNodeMixin<GraphQuery_Add_Node_End> implements IGraphQuery_Link {
//   GraphQuery_Add_Node_End<T> nodeBy<T>(T node, [space = NoneSpace]) => GraphQuery_Add_Node_End<T>(this, node, space);
// }

// //==================================================

// class GraphQuery_Add_Link<T> extends GraphQuery_Link<T> with GraphQueryGETNodeMixin<GraphQuery_Add_Node_End>, IGraphQuery_Add_Link {
//   GraphQuery_Add_Link([space = NoneSpace, Maybe<T> value]) : super(space, value);
// }

// //==================================================

// class GraphQuery_Add_LinkTo<T> extends GraphQuery_LinkTo<T> with GraphQueryGETNodeMixin<GraphQuery_Add_Node_End>, IGraphQuery_Add_Link {
//   GraphQuery_Add_LinkTo([space = NoneSpace, Maybe<T> value]) : super(space, value);
// }

// //====================================================================================================
