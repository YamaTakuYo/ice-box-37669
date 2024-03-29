# README

# 冷蔵庫管理アプリ

# アプリ概要

購入した食材のロスを無くすための食材管理アプリです。
食材管理の他に、料理投稿ができます。


# URL

### https://ice-box-37669.herokuapp.com/


# 作成背景

### 冷蔵庫の中の物のうっかり忘れを無くしたい
 
買い物をするお客様が、何を買うのか、何が冷蔵庫庫にあったのかという課題を解決するために今回のオリアプを作成しました。また、作成するにあたって、ただ文字だけを並べても見にくいので、一目見ただけで食材の賞味期限がわかるようにカレンダーと連携し、表形式で賞味期限まであと何日であるかの表示を行いました。使用後には削除するための機能も必要であると思い削除機能も付与しました。

# 機能一覧

- ユーザー登録機能

  - メールアドレス
  - パスワード
  - ニックネーム
  - 秘密の質問（選択式）
  - 秘密の質問の答え（自分で入力）

- ログイン機能

  - devise でログイン機能を実装

- 投稿ページ

  - 商品名・ジャンル・賞味期限・備考を登録する機能
  - 編集機能
  - 削除機能
  - ジャンル分け機能

- 料理投稿ページ

  - 投稿機能
  - 編集機能
  - 削除機能



### 工夫したこと

- 食材登録の際に、賞味期限までの日数が表示されるように実装しました。
- 商品ごとにジャンル分けのできるよう、 categoryテーブルと refrigerator テーブルを関連づけし、タグ機能を追加しました。
- 料理投稿機能にJavaScriptを導入するために、seasoningテーブルと ingredientテーブル、 procedureテーブルを分け、行を増やすために別テーブルで作成しました。recipeテーブルと関連付けることで、各テーブルに保存できるよう行いました。


https://user-images.githubusercontent.com/100755824/164155373-66046359-e7d0-4e52-9e52-7c2262cd9cd5.mp4
### これから追加したい機能

- refrigeratorテーブルからrecipeテーブルへの食材検索機能
- JavaScriptを導入し、動的なサイトにする
- レスポンシブ対応

# 使用技術

- 言語 : Ruby
- フレームワーク：Ruby on Rails 
- フロントエンド : HTML&CSS/JavaScript/
- DB : MySQL
- インフラ : Heroku(ステージング環境 → 本番環境)
- ソースコード管理：GitHub
- 開発環境：MacOS/Visual Studio Code

# ER 図

## Usersテーブル

|Column             |Type     |Options     |
|-------------------|---------|------------|
|nickname           | string  | null:false |
|email              | string  | null:false |
|encrypted_password | string  | null:false |
|secret_id          | integer | null:false |
|answer             | text    | null:false |

### Association
has_many:refrigerator
has_many:recipe

## Refrigeratorsテーブル

|Column      |Type        |Options                       |
|------------|------------|------------------------------|
|user        | references | null:false, foreign_key:true |
|food        | string     | null:false                   |
|category_id | integer    | null:false                   |
|ex_date     | datetime   | null:false                   |
|remarks     | text       |                              |

### Association
belongs_to :user

## Recipesテーブル

|Column       |Type        |Options                       |
|-------------|------------|------------------------------|
|user         | references | null:false, foreign_key:true |
|name         | string     | null:false                   |

### Association
belongs_to :user
has_one_attached :image
has_many :ingredients
has_many :seasonings
has_many :procedures


## Ingredientsテーブル

|Column       |Type        |Options                       |
|-------------|------------|------------------------------|
|recipe       | references | null:false, foreign_key:true |
|name         | string     | null:false                   |

### Association
belongs_to :recipe

## Sesoningsテーブル

|Column       |Type        |Options                       |
|-------------|------------|------------------------------|
|recipe       | references | null:false, foreign_key:true |
|name         | string     | null:false                   |

### Association
belongs_to :recipe

## Proceduresテーブル

|Column       |Type        |Options                       |
|-------------|------------|------------------------------|
|recipe       | references | null:false, foreign_key:true |
|name         | string     | null:false                   |

### Association
belongs_to :recipe

![ER](https://user-images.githubusercontent.com/100755824/164153590-4990950b-92de-4f50-aee6-e1c0f2f340ad.png)