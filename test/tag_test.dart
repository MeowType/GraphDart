// import 'package:test/test.dart';

// import 'package:graph_collection/graph.dart';
// import 'package:some/index.dart';

// void main() {
//   group('tags', () {
//     test('linkTo', () {
//       final g = Graph();
//       final from = 'from', to = 'to', t1 = 'tag1', t2 = 'tag2', t3 = 'tag3';

//       g.linkTo(from, to, tags: [t1, t2]);

//       expect(g.hasLinkTo(from, to, anyTags: [t1]), isTrue);
//       expect(g.hasLinkTo(from, to, anyTags: [t3]), isFalse);
//       expect(g.hasLinkTo(from, to, anyTags: [t2, t3]), isTrue);

//       expect(g.hasLinkTo(from, to, allTags: [t1]), isTrue);
//       expect(g.hasLinkTo(from, to, allTags: [t1, t2]), isTrue);
//       expect(g.hasLinkTo(from, to, allTags: [t1, t3]), isFalse);

//       expect(g.hasLinkTo(from, to, anyTags: [t1], allTags: [t1]), isTrue);
//       expect(g.hasLinkTo(from, to, anyTags: [t3], allTags: [t1, t2]), isFalse);
//       expect(
//           g.hasLinkTo(from, to, anyTags: [t2, t3], allTags: [t1, t3]), isFalse);
//     });

//     test('setTo get', () {
//       final g = Graph();
//       final from = 'from',
//           to = 'to',
//           key = 'key',
//           val = 'val',
//           t1 = 'tag1',
//           t2 = 'tag2',
//           t3 = 'tag3';

//       g.setTo(from, to, key, val, tags: [t1, t2]);

//       expect(g.hasEdgeTo(from, to, key, anyTags: [t1]), isTrue);
//       expect(g.hasEdgeTo(from, to, key, anyTags: [t3]), isFalse);
//       expect(g.hasEdgeTo(from, to, key, anyTags: [t2, t3]), isTrue);

//       expect(g.hasLinkTo(from, to, anyTags: [t1]), isFalse);
//       expect(g.hasLinkTo(from, to, anyTags: [t3]), isFalse);
//       expect(g.hasLinkTo(from, to, anyTags: [t2, t3]), isFalse);

//       expect(g.hasEdgeTo(from, to, key, allTags: [t1]), isTrue);
//       expect(g.hasEdgeTo(from, to, key, allTags: [t1, t2]), isTrue);
//       expect(g.hasEdgeTo(from, to, key, allTags: [t1, t3]), isFalse);

//       expect(g.hasLinkTo(from, to, allTags: [t1]), isFalse);
//       expect(g.hasLinkTo(from, to, allTags: [t1, t2]), isFalse);
//       expect(g.hasLinkTo(from, to, allTags: [t1, t3]), isFalse);

//       expect(g.hasEdgeTo(from, to, key, anyTags: [t1], allTags: [t1]), isTrue);
//       expect(g.hasEdgeTo(from, to, key, anyTags: [t3], allTags: [t1, t2]),
//           isFalse);
//       expect(g.hasEdgeTo(from, to, key, anyTags: [t2, t3], allTags: [t1, t3]),
//           isFalse);

//       expect(g.hasLinkTo(from, to, anyTags: [t1], allTags: [t1]), isFalse);
//       expect(g.hasLinkTo(from, to, anyTags: [t3], allTags: [t1, t2]), isFalse);
//       expect(
//           g.hasLinkTo(from, to, anyTags: [t2, t3], allTags: [t1, t3]), isFalse);

//       expect(g.get(from, to, key, anyTags: [t1]) is Some, isTrue);
//       expect(g.get(from, to, key, anyTags: [t3]) is None, isTrue);
//       expect(g.get(from, to, key, anyTags: [t2, t3]) is Some, isTrue);

//       expect(g.get(from, to, key, allTags: [t1]) is Some, isTrue);
//       expect(g.get(from, to, key, allTags: [t1, t2]) is Some, isTrue);
//       expect(g.get(from, to, key, allTags: [t1, t3]) is None, isTrue);

//       expect(
//           g.get(from, to, key, anyTags: [t1], allTags: [t1]) is Some, isTrue);
//       expect(g.get(from, to, key, anyTags: [t3], allTags: [t1, t2]) is None,
//           isTrue);
//       expect(g.get(from, to, key, anyTags: [t2, t3], allTags: [t1, t3]) is None,
//           isTrue);
//     });
//   });
// }
