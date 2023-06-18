# テーブル設計

## users テーブル

| Column                     | Type    | Options                   |
| -------------------------- | ------- | ------------------------- |              
| nickname                   | string  | null: false               |
| email                      | string  | null: false, unique: true |
| encrypted_password         | string  | null: false               |
| last_name_full_width       | string  | null: false               |
| first_name_full_width      | string  | null: false               |
| last_name_kana_full_width  | string  | null: false               |
| first_name_kana_full_width | string  | null: false               |
| date_of_birth              | date    | null: false               |

### Association . 　

<!-- ↑xc一s112b「

-->

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |                 
| goods              | string     | null: false                    |
| explain            | text       | null: false                    |
| category_id        | integer    | null: false                    |
| situation_id       | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| number_of_date_id  | integer    | null: false                    |
| price              | integer    | null: false                    |            
| user               | references | null: false, foreign_key: true |           

### Association

- belongs_to :users
- has_one :purchases

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |                            
| item    | references | null: false, foreign_key: true |                           

### Association

- belongs_to :users
- belongs_to :items
- has_one :address

## address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |            
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |                            

### Association

- belongs_to :purchases
