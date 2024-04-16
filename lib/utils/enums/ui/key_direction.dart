import 'package:flame/components.dart';

enum KeyDirection {
  upLeft(0,0),
  up(1,0),
  upRight(2,0),
  left(0,1),
  center(1,1),
  right(2,1),
  downLeft(0,2),
  down(1,2),
  downRight(2,2);

  final double x;
  final double y;
  const KeyDirection(this.x, this.y);

  static get leftSide => [upLeft, left, downLeft];
  static get rightSide => [upRight, right, downRight];
  static get otherSide => [up, center, down];
}