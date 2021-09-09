# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## usersテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| email           | string    | null: false |
| encrypted_password | string | null: false |
| last_name       | string    | null: false |
| first_name      | string    | null: false |
| last_name_kana  | string    | null: false |
| first_name_kana | string   | null: false |
| nickname        | string    | null: false |
| birthday        | date    | null: false |

### Association
has_many : orders
has_many : items


 ## addressesテーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| prefecture_id   | integer          | null: false                    |
| municipality  | string          | null: false                    |
| address       | string          | null: false                    |
| building_name | string        |                     | 
| phone_number  | string       | null: false                    |
| postal_code   | string       | null: false                    |
| order        | references    | null: false, foreign_key: true |

### Association
belongs_to : order


## itemsテーブル


| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| product_description   | text    | null: false |
| product_name          | string  | null: false |
| product_status_id       | integer    | null: false |
| load_id              | integer    | null: false |
| selling_price         | integer | null: false |
| ship_id              | integer    | null: false |
| prefecture_id              | integer    | null: false |
| category_id              | integer    | null: false |
| user        | references    | null: false, foreign_key: true |

### Association
has_one : order
belongs_to : user



## ordersテーブル


| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |


### Association
has_one : address
belongs_to : item
belongs_to : user

