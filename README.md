#テーブル設計

## usersテーブル

| Column             | Type    | Option                    |
|------------------------------------------------------------
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| family_name_kana   | string  | null: false               | 
| first_name         | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |


### Associations
- has_many :buy_items
- has_many :comments
- has_many :buy_management


## buy_itemsテーブル

|Column         | Type        | Option                         |
|-----------------------------------------------------------   |
| name          | string      | null: false                    |
| price         | integer     | null: false                    |
| condition_id  | integer     | null: false                    |
| experience    | text        | null: false                    |
| user          | reference   | null: false, foreign_key: true |
| delivery_fee_id | integer   | null: false                    |
| delivery_area_id | integer  | null: false                    |
| delivery_day_id | integer   | null: false                    |

### Associations 
- belongs_to :user
- has_many :comments


## buy_management

| Column   | Type      | Option                         |
|-------------------------------------------------------|
| user     | reference | null: false, foreign_key: true |
| buy_item | reference | null: false, foreign_key: true |

### Association
- has_many :buy_items
- belongs_to :user


## comments

| Column    | Type      | Option                         |
|---------------------------------------------------------
| user      | reference | null: false, foreign_key: true |
| buy_item  | reference | null: false                    |
| text      | text      | null: false                    |

### Associations
- belongs_to :user
- belongs_to :buy_item


## shopping_address

|Column         | Type       | Option                         |
|-------------------------------------------------------------|
| postal_code   | string     | null: false                    | 
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| phone_number  | string     | null: false                    | 
| build         | string     |                                |
| buy_management| reference  | null: false, foreign_key: true |

### Association
- belongs_to :buy_management


