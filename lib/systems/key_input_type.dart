import 'package:flame/components.dart';

enum KeyInputType {
  upLeft(KeyType.move),
  up(KeyType.move),
  upRight(KeyType.move),
  left(KeyType.move),
  center(KeyType.move),
  right(KeyType.move),
  downLeft(KeyType.move),
  down(KeyType.move),
  downRight(KeyType.move),
  attack(KeyType.action),
  other(KeyType.other),
  none(KeyType.other);
  
  final KeyType type;
  const KeyInputType(this.type);
  

  static get directionKeys => [upLeft, up, upRight, left, center, right, downLeft, down, downRight];

  static get leftDirectionKeys => [upLeft, left, downLeft];
  static get rightDirectionKeys => [upRight, right, downRight];
  static get otherDirectionKeys => [up, center, down];
}

enum KeyType {
  move,
  action,
  other
}

enum _CommandType {
  move,
  attack,
  consume,
  equip,
  neutral,
}