import 'package:ref_out_box/ref_out_box.dart';

abstract class Or<Le, Ri> {
  bool get isL;
  bool get isR;
  Le get getL;
  Ri get getR;
  factory Or.L(Le val) = OrLeft<Le>;
  factory Or.R(Ri val) = OrRight<Ri>;
}

abstract class _AOr<L, R> implements Or<L, R> {
  bool get isL => false;
  bool get isR => false;
  L get getL => null;
  R get getR => null;
}

class OrLeft<L> extends _AOr<L, Null> implements Box<L> {
  final bool isL = true;
  final L getL;
  L get val => getL;

  OrLeft(this.getL);
}

class OrRight<R> extends _AOr<Null, R> implements Box<R> {
  final bool isR = true;
  final R getR;
  R get val => getR;

  OrRight(this.getR);
}
