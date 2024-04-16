# rogue_adventure



このプロジェクトは、Flutter Flameを使用して開発されたゲームです。以下のディレクトリ構成を採用しています。

Markdown
# ディレクトリ構成

## ディレクトリ

### assets/

- 画像、音源、フォントなどのアセットファイルを格納します。
    - `images/`: 背景、キャラクター、オブジェクトなどの画像ファイル
    - `sounds/`: BGM、効果音などの音源ファイル
    - `fonts/`: ゲーム内で使用するフォントファイル

### lib/

- ゲームのソースコードを格納します。
    - `main.dart`: アプリの起動処理を担当します。
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

#### images/

背景、キャラクター、オブジェクトなどの画像ファイルを格納します。

#### sounds/

BGM、効果音などの音源ファイルを格納します。

#### fonts/

ゲーム内で使用するフォントファイルを格納します。

### lib/

ゲーム本体のコードや、ゲーム開発で汎用的に使用されるユーティリティコードなどを格納します。

#### main.dart

アプリの起動処理を担当します。

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

