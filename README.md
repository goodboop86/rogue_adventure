# rogue_adventure



このプロジェクトは、Flutter Flameを使用して開発されたゲームです。以下のディレクトリ構成を採用しています。

Markdown
# ディレクトリ構成

## ディレクトリ

### assets/

- 画像、音源、フォントなどのアセットファイルを格納します。
    - `image/`: 背景、キャラクター、オブジェクトなどの画像ファイル
    - `sounds/`: BGM、効果音などの音源ファイル
    - `fonts/`: ゲーム内で使用するフォントファイル

### lib/

- ゲームのソースコードを格納します。
    - `main.dart`: アプリの起動処理を担hitします。
    - `game/`: ゲーム本体のコードを格納します。
        - `my_game.dart`: ゲームクラスを定義します。
        - `components/`: ゲーム画面に表示されるコンポーネントを格納します。
        - `entities/`: ゲーム世界のエンティティを格納します。
        - `scenes/`: ゲームの各シーンを格納します。
        - `systems/`: ゲーム全体の動作を制御するシステムを格納します。
    - `utils/`: ゲーム開発で汎用的に使用されるユーティリティコードを格納します。

### pubspec.yaml

- プロジェクトで使用されるライブラリや依存関係を定義します。

### README.md

- プロジェクトの概要、使用方法などを説明します。

## 各ディレクトリ詳細

#### assets/

ゲームに必要な画像、音源、フォントなどを格納します。

#### image/

背景、キャラクター、オブジェクトなどの画像ファイルを格納します。

#### sounds/

BGM、効果音などの音源ファイルを格納します。

#### fonts/

ゲーム内で使用するフォントファイルを格納します。

### lib/

ゲーム本体のコードや、ゲーム開発で汎用的に使用されるユーティリティコードなどを格納します。

#### main.dart

アプリの起動処理を担hitします。

#### game/

ゲーム本体のコードを格納します。

##### my_game.dart

ゲームクラスを定義します。

##### components/

ゲーム画面に表示されるコンポーネントを格納します。

##### entities/

ゲーム世界のエンティティを格納します。

##### scenes/

ゲームの各シーンを格納します。

##### systems/

ゲーム全体の動作を制御するシステムを格納します。

#### utils/

ゲーム開発で汎用的に使用されるユーティリティコードを格納します。

### pubspec.yaml

プロジェクトで使用されるライブラリや依存関係を定義します。

### README.md

プロジェクトの概要、使用方法などを説明します。

クラス図

classDiagram
```mermaid
classDiagram
    class Enhance {
        - EnhanceType type
        - Expireble effectiveTurn
        + isExpired()

    }

    class Condition {
        - ConditionType type
        - Expireble effectiveTurn
        + isExpired()

    }

    class Expireble {
        - bool permanent
        - int range
        - int remain
        + decrement()
        + reset()
    }


    class Param {
      -int hp
      -int ep
      -int atk
      -int def
      -double hitRate
      -double numOfAct
    }
    class ConditionType {
      - SLEEP
      - BLIND
      - CONFUSE
    }


    class EnhanceType {
      - POW_UP
      - DEF_UP
      - HITRATE_UP
      - POW_DOWN
      - DEF_DOWN
      - HITRATE_DOWN
      - DOUBLE_SPEED
      - SPIRITUAL_VISION
      - PHYSICAL_VISION
      - INVINCIBLE
      - PERFECT_HIT
    }


    class Phase {
      - STANDING
      - NOAWARE
      - CAUTION
      - BATTLE
      - ESCAPE
    }
    class Charactor{
      + Param Param
      + List~Enhance~ enhances
      + List~Condition~ conditions
      +attack()
      +move()
      +drop()
      +throw()
    }
    class Player{
      Weapon Weapon
      Shield Shield
      Accesory accesory1
      Accesory accesory2
      Inventory inventry
      +equip()
      +unEquip()
      +pickup()
      +consume()
    }
    class Enemy{
      -Phase phase

    }
    class NPC{
      -Phase phase
    }

    Equipment <|-- Weapon
    Equipment <|-- Shield
    Equipment <|-- Accesory



    Weapon <-- Player
    Shield <-- Player
    Accesory <-- Player




    class Equipment {
    - int atk_pow
    - int def_pow
    - List~Enhance~ enhance
    }

    class Weapon {
    - int atk_pow
    - int def_pow
    - List~Enhance~ enhance
    }

    class Shield {
    - int atk_pow
    - int def_pow
    - List~Enhance~ enhance
    }

    class Accesory {
    - int atk_pow
    - int def_pow
    - List~Enhance~ enhance
    }

    Consumable <|-- Food
    Consumable <|-- Scroll
    Consumable <|-- Weed

    class Consumable {
    }

    class Food {
    - int fullness
    - List~Enhance~ enhance
    }

    class Scroll {
    - List~Enhance~ enhance
    }

    class Weed {
    - List~Enhance~ enhance
    }


    Item <|-- Equipment
    Item <|-- Consumable

    class Item {

    }

    Item <-- Inventory
    Inventory <-- Player

    class Inventory {
    - List~Item~ inventory
    }

Param <-- Charactor
Enhance <-- Charactor
Condition <-- Charactor
Phase <-- Enemy
Phase <-- NPC
Charactor <|-- Player
Charactor <|-- Enemy
Charactor <|-- NPC

Expireble <-- Enhance
EnhanceType <-- Enhance
Expireble <-- Condition
ConditionType <-- Condition



```

アイテムのライフサイクル
```mermaid
stateDiagram-v2
    direction LR
    [*] --> have[ALL]
    have[ALL] --> drop[ALL]
    have[ALL] --> throw[ALL]
    have[ALL] --> consume[consumable]
    have[ALL] --> equip[equipment]
    drop[ALL] --> have[ALL]
    throw[ALL] --> hit[ALL]
    equip[equipment] --> unEquip[equipment]
    equip[equipment]--> throw[ALL]
    equip[equipment]--> drop[ALL]
    unEquip[equipment]--> drop[ALL]
    unEquip[equipment] --> equip[equipment]
    unEquip[equipment] --> throw[ALL]
    consume[consumable] --> [*]
    drop[ALL] --> [*]
    hit[ALL] --> [*]
    throw[ALL] --> drop[ALL]

    

```

ゲームの進行 プロセス
## 図
```mermaid
stateDiagram-v2
    [*] --> battleState
    battleState --> [*]
    
    state battleState {
        state isPlayerActionable <<choice>>
        [*] --> isPlayerActionable
        isPlayerActionable --> playerAction: isPlayerActionable=true
        isPlayerActionable --> isEnemyActionable: isPlayerActionable=false
        
        state playerAction {
            state isPlayerMovable <<choice>>
            [*] --> isPlayerMovable
            isPlayerMovable --> playerMove: isPlayerMovable=true
            state isPlayerAttackable <<choice>>
            [*] --> isPlayerAttackable
            isPlayerAttackable --> playerAttack: isPlayerAttackable=true
            state isPlayerConsumable <<choice>>
            [*] --> isPlayerConsumable
            isPlayerConsumable --> playerConsume: isPlayerConsumable=true
        }

        state isEnemyActionable <<choice>>
        
        playerAction --> isEnemyActionable
        isEnemyActionable --> enemyAction: isEnemyActionable=true
        isEnemyActionable --> isEnemyKilled: isEnemyActionable=false

        state enemyAction {
            state isEnemyMovable <<choice>>
            [*] --> isEnemyMovable
            isEnemyMovable --> EnemyMove: isEnemyMovable=true
            state isEnemyAttackable <<choice>>
            [*] --> isEnemyAttackable
            isEnemyAttackable --> EnemyAttack: isEnemyAttackable=true
            state isEnemyConsumable <<choice>>
            [*] --> isEnemyConsumable
            isEnemyConsumable --> EnemyConsume: isPlayerConsumable=true
        }

        state isEnemyKilled <<choice>>
        isEnemyKilled --> [*]: isEnemyKilled=true
        isEnemyKilled --> isPlayerActionable: isEnemyKilled=false

        state isPlayerDied <<choice>>
        enemyAction --> isPlayerDied
        isPlayerDied --> [*]: isPlayerDied=true
        isPlayerDied --> isPlayerActionable: isPlayerDied=false
        
        enemyAction --> [*]
    }
```

AdventureEffectの種類
(有効化: AdventureEffectが発火しうる状態になる)
- キャラクターに能力が付与される
- 能力が付与された状態で条件により発動する
  - 攻撃成功/失敗時の一定確率
  - 
  - 防御成功/失敗時の一定確率
  - 
  - 常時

```mermaid
stateDiagram-v2
    direction LR
    [*] --> expireble
    expireble --> slip: 行動できるがターンごとに弱いネガティブ要素がある
    slip --> poison/burn/bleed
    expireble --> incapacitated: 行動が制限される
    incapacitated --> stun/sleep/freeze/charm
    expireble --> deBuff: 行動でき、一定ターンネガティブ要素が続く
    [*] --> immediate
```


AdventureEffectの発火タイミング
```mermaid
stateDiagram-v2
    direction LR
    [*] --> have[ALL]
    have[ALL] --> drop[ALL]
    have[ALL] --> throw[ALL]
    have[ALL] --> have[ALL]
    have[ALL] --> consume[consumable]
    have[ALL] --> equip[equipment]
    drop[ALL] --> have[ALL]
    throw[ALL] --> hit[ALL]
    equip[equipment] --> unEquip[equipment]
    equip[equipment] --> beforeAttack[equipment]
    beforeAttack[equipment] --> attack[equipment]
    attack[equipment] --> afterAttack[equipment]
    equip[equipment] --> beforeAttack[equipment]
    equip[equipment] --> beforeAttack[equipment]
    beforeBlock[equipment] --> block[equipment]
    block[equipment] --> afterBlock[equipment]
    equip[equipment]--> throw[ALL]
    equip[equipment]--> drop[ALL]
    unEquip[equipment]--> drop[ALL]
    unEquip[equipment] --> equip[equipment]
    unEquip[equipment] --> throw[ALL]
    consume[consumable] --> [*]
    drop[ALL] --> [*]
    hit[ALL] --> [*]
    throw[ALL] --> drop[ALL]
    

```





