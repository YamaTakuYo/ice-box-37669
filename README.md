# README

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
has_many   :recipe

## Recipesテーブル

|Column       |Type        |Options                       |
|-------------|------------|------------------------------|
|user         | references | null:false, foreign_key:true |
|refrigerator | references | null:false, foreign_key:true |
|name         | string     | null:false                   |
|ingredients  | integer    | null:false                   |
|seasoning    | integer    | null:false                   |
|procedure    | integer    | null:false                   |
|created_at   | datetime   | null:false                   |
|time_id      | integer    | null:false                   |

### Association
belongs_to :user
belongs_to :refrigerator

## Shoppingsテーブル

|Column       |Type        |Options                       |
|-------------|------------|------------------------------|
|refrigerator | references | null:false, foreign_key:true |
|item         | integer    | null:false                   |
|detail       | integer    | null:false                   |

### Association
belongs_to :refrigerator

## Heartsテーブル

|Column     |Type        |Options                       |
|-----------|------------|------------------------------|
|user       | references | null:false, foreign_key:true |
|recipe     | references | null:false, foreign_key:true |
|point      | integer    | null:false                   |

### Association
belongs_to :user
belongs_to :recipe
