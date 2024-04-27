
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
  
  final KeyType keyType;
  const KeyInputType(this.keyType);
  

  static get directionKeys => [upLeft, up, upRight, left, center, right, downLeft, down, downRight];

  static get leftDirectionKeys => [upLeft, left, downLeft];
  static get rightDirectionKeys => [upRight, right, downRight];
  static get otherDirectionKeys => [up, center, down];
  static bool isRight(KeyInputType key) => rightDirectionKeys.contains(key);
  static bool isLeft(KeyInputType key) => leftDirectionKeys.contains(key);
}

enum KeyType {
  move,
  action,
  other
}

enum ActType {
  move,
  attack,
  consume,
  equip,
  neutral,
}