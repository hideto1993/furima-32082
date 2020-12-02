# DB設計

## usersテーブル

| Column                    | Type       | Options           |
|---------------------------|------------|-------------------|
| nickname                  | string     | null: false       |
| email                     | string     | null: false       |
| encrypted_password        | string     | null: false       |
| first_name                | string     | null: false       |
| second_name               | string     | null: false       |
| first_name_kana           | string     | null: false       |
| second_name_kana          | string     | null: false       |
| birthday                  | integer    | null: false       |

* has_many :items
* has_many :purchases

## itemsテーブル

| Column                    | Type       | Options           |
|---------------------------|------------|-------------------|
| title                     | string     | null: false       |
| category_id               | integer    | null: false       |
| status_id                 | integer    | null: false       |
| price                     | integer    | null: false       |
| burden fee_id             | integer    | null: false       |
| shipping_area_id          | integer    | null: false       |
| shipping_date_and_time_id | integer    | null: false       |
| explanation               | text       | null: false       |
| user                      | references | foreign_key: true |

- belongs_to :users
* has_one :purchases

## purchasesテーブル

| Column                    | Type       | Options           |
|---------------------------|------------|-------------------|
| user                      | references | foreign_key: true |
| item                      | references | foreign_key: true |

* has_one :shipping addresses
- belongs_to :users
- belongs_to :items

## shipping addressesテーブル

| Column                    | Type       | Options           |
|---------------------------|------------|-------------------|
| prefectures               | string     | null: false       |
| municipalities            | string     | null: false       |
| address                   | string     | null: false       |
| building_number           | string     | null: false       |
| postal_code               | string     | null: false       |
| phone_number              | string     | null: false       |
| purchase                  | references | foreign_key: true |

- belongs_to :purchases