# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |                  
| goods   | string     | null: false                    |
| price   | string     | null: false                    |            
| seller  | string     | null: false                    |
| user_id | references | null: false, foreign_key: true |           

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| goods   | string     | null: false                    |
| buyer   | string     | null: false                    |
| user_id | references | null: false, foreign_key: true |                            
| item_id | references | null: false, foreign_key: true |                           

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveries テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postcode       | string     | null: false                    |            
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| buy_id         | references | null: false, foreign_key: true |                             

### Association

- belongs_to :buy
