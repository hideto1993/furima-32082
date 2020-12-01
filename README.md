# DB設計

## usersテーブル

| Column   | Type       | Options           |
|----------|------------|-------------------|
| name     | string     | null: false       |
| email    | string     | null: false       |
| password | string     | null: false       |

* has_many :items

## itemsテーブル

| Column   | Type       | Options           |
|----------|------------|-------------------|
| title    | string     | null: false       |
| category | string     | null: false       |
| price    | string     | null: false       |
| user     | references | foreign_key: true |

- belongs_to :user

## purchaseテーブル

* has_one :shipping address

## shipping addressテーブル

- belongs_to :purchase