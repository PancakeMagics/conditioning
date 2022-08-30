part of 'pes_pen.dart';

class PesItem<A> {
  final Offset itemZeroOffset;
  final Size itemSize;
  final A item;

  const PesItem({
    required this.itemZeroOffset,
    required this.itemSize,
    required this.item,
  });
}