# DB設計

## usersテーブル

| Column                 | Type       | Options           |
|------------------------|------------|-------------------|
| nickname               | string     | null: false       |
| email                  | string     | null: false       |
| encrypted_password     | string     | null: false       |
| first_name             | string     | null: false       |
| second_name            | string     | null: false       |
| first_name_kana        | string     | null: false       |
| second_name_kana       | string     | null: false       |

* has_many :items

## itemsテーブル

| Column                 | Type       | Options           |
|------------------------|------------|-------------------|
| title                  | string     | null: false       |
| category               | string     | null: false       |
| status                 | string     | null: false       |
| price                  | string     | null: false       |
| burden fee             | string     | null: false       |
| shipping_area          | string     | null: false       |
| shipping_date_and_time | string     | null: false       |
| explanation            | text       | null: false       |
| user                   | references | foreign_key: true |

- belongs_to :user

## purchaseテーブル

| Column                 | Type       | Options           |
|------------------------|------------|-------------------|
| user                   | references | foreign_key: true |
| item                   | references | foreign_key: true |

* has_one :shipping address

## shipping addressテーブル

| Column                 | Type       | Options           |
|------------------------|------------|-------------------|
| municipalities         | string     | null: false       |
| address                | string     | null: false       |
| building_number        | string     | null: false       |
| postal_code            | string     | null: false       |
| phone_number           | string     | null: false       |

- belongs_to :purchase