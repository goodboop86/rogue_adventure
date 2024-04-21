/**
 * 行動状態
 */
enum ActType {
  playerActBegin,
  playerAct,
  playerActEnd,

  enemyActBegin,
  enemyAct,
  enemyActEnd,

  playerMoveBegin,
  playerMove,
  playerMoveEnd,

  enemyMoveBegin,
  enemyMove,
  enemyMoveEnd;

  get getPlayerAct => [playerActBegin, playerAct, playerActEnd];
  get getEnemyAct => [enemyActBegin, enemyAct, enemyActEnd];
  get getPlayerMove => [playerMoveBegin, playerMove, playerMoveEnd];
  get getEnemyMove => [enemyMoveBegin, enemyMove, enemyMoveEnd];
}

enum TurnStateType {
  keyInput,
  playerTurn,
  enemyTurn,
  turnEnd;   // ターン終了
}