# テーブル設計

## users テーブル

| Column                     | Type    | Options                   |
| -------------------------- | ------- | ------------------------- |              
| nickname                   | string  | null: false               |
| email                      | string  | null: false, unique: true |
| encrypted_password         | string  | null: false               |
| last name_full width       | string  | null: false               |
| first name_full width      | string  | null: false               |
| last name kana_full width  | string  | null: false               |
| first name kana_full width | string  | null: false               |
| day of birth               | date    | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |                 
| goods              | string     | null: false                    |
| explain            | text       | null: false                    |
| category_id        | integer    | null: false                    |
| situation_id       | integer    | null: false                    |
| shipping charge_id | integer    | null: false                    |
| prefectures_id     | integer    | null: false                    |
| number of days_id  | integer    | null: false                    |
| price              | integer    | null: false                    |            
| user               | references | null: false, foreign_key: true |           

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |                            
| item    | references | null: false, foreign_key: true |                           

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveries テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post code        | string     | null: false                    |            
| prefectures_id   | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building name    | string     |                                |
| telephone number | string     | null: false                    |
| buy              | references | null: false, foreign_key: true |                            

### Association

- belongs_to :buy

