import 'maybe.dart';
import 'utils.dart';

Node newNode() => Node();

class Node {
  final Set<Node> from = Set();

  final Map<Node, Map<dynamic, Maybe<dynamic>>> to = {};

  static Map<dynamic, Maybe<dynamic>> newInnerMap() =>
      Map<dynamic, Maybe<dynamic>>();

  void setFrom(Node node) {
    from.add(node);
  }

  void setTo(Node node) {
    add_or_get(to, node, () => Map());
  }

  void setToV(Node node, key, val) {
    final map = add_or_get(to, node, newInnerMap);
    map[key] = Some(val);
  }

  void setToT<T>(Node node, val) {
    final map = add_or_get(to, node, newInnerMap);
    map[T] = Some(val);
  }

  Maybe get(Node node, key) {
    if (to.containsKey(node)) {
      final map = to[node];
      if (map.containsKey(key)) {
        return map[key];
      }
    }
    return None();
  }

  Maybe getT<T>(Node node) {
    if (to.containsKey(node)) {
      final map = to[node];
      if (map.containsKey(T)) {
        return map[T];
      }
    }
    return None();
  }

  bool hasFrom(Node node) {
    return from.contains(node);
  }

  bool hasTo(Node node) {
    return to.containsKey(node);
  }

  bool hasToV(Node node, key) {
    if (to.containsKey(node)) {
      final map = to[node];
      return map.containsKey(key);
    }
    return false;
  }

  bool hasToT<T>(Node node) {
    if (to.containsKey(node)) {
      final map = to[node];
      return map.containsKey(T);
    }
    return false;
  }

  bool unsetFrom(Node node) {
    return from.remove(node);
  }

  bool unsetTo(Node node) {
    return to.remove(node) != null;
  }

  bool unsetToV(Node node, key) {
    if (to.containsKey(node)) {
      final map = to[node];
      return map.remove(key) != null;
    }
    return false;
  }

  bool unsetToT<T>(Node node) {
    if (to.containsKey(node)) {
      final map = to[node];
      return map.remove(T) != null;
    }
    return false;
  }
}
