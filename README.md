# テーブル設計

## users テーブル

| Column                | Type   | Options      |
| --------------------- | ------ | ------------ |
| nickname              | string | null: false  |
| email                 | string | unique: true |
| password              | string | null: false  |
| password_confirmation | string | null: false  |
| last_name             | string | null: false  |
| first_name            | string | null: false  |
| last_name_kana        | string | null: false  |
| first_name_kana       | string | null: false  |
| birth_date            | string | null: false  |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| items_name             | string     | null: false       |
| info                   | text       | null: false       |
| category_id            | integer    | foreign_key: true |
| sales_status_id        | integer    | foreign_key: true |
| shipping_fee_status_id | integer    | foreign_key: true |
| prefecture_id          | integer    | foreign_key: true |
| scheduled_delivery_id  | integer    | foreign_key: true |
| price                  | integer    | null: false       |
| exhibitor              | references | foreign_key: true |

### Association

- belong_to :user
- has_one :order

## orders テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| postal_code           | integer | null: false |
| items_name            | string  | null: false |
| info                  | text    | null: false |

### Association

- belong_to :item
- belong_to :user

## address テーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| postal_code           | string     | null: false       |
| prefecture_id         | integer    | foreign_key: true |
| city                  | text       | null: false       |
| house_number          | text       | null: false       |
| building_name         | text       | null: false       |
| phone_number          | string     | null: false       |
| orders                | references | foreign_key: true |
### Association

- belong_to :order
