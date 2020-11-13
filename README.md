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

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| image                 | text    | null: false |
| items_name            | string  | null: false |
| info                  | text    | null: false |
| category              | text    | null: false |
| sales_status          | text    | null: false |
| shipping_fee_status   | integer | null: false |
| prefecture            | text    | null: false |
| scheduled_delivery    | string  | null: false |
| price                 | integer | null: false |
| exhibitor             | string  | null: false |

### Association

- belong_to :users
- has_one :orders

## orders テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| postal_code           | integer | null: false |
| items_name            | string  | null: false |
| info                  | text    | null: false |

### Association

- belong_to :items
- has_one :address

## address テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| postal_code           | string  | null: false |
| prefecture            | string  | null: false |
| city                  | text    | null: false |
| addresses             | text    | null: false |
| phone_number          | integer | null: false |

### Association

- belong_to :users
- belong_to :orders
