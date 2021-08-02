#テーブル設計

## usersテーブル

| Column             | Type    | Option                |
|-------------------------------------------------------
| nickname           | string  | NOT NULL              |
| email              | string  | NOT NULL, UNIQUE TRUE |
| encrypted_password | string  | NOT NULL              |
| family_name        | string  | NOT NULL              |
| family_name_kana   | string  | NOT NULL              | 
| first_name         | string  | NOT NULL              |
| first_name_kana    | string  | NOT NULL              |
| birthday           | date    | NOT NULL              |


### Associations
- has_many :buy_items
- has_many :comments
- belongs_to :address


## buy_itemsテーブル

|Column            | Type      | Option   |
|------------------------------------------
| name             | string    | NOT NULL |
| price            | integer   | NOT NULL |
| condition_id     | integer   | NOT NULL |
| experience       | text      | NOT NULL |
| users            | reference | NOT NULL |
| comments         | text      | NOT NULL |

### Associations 
- belongs_to :user
- has_many :comments


## shopping_address

| Column           | Type      | NOT NULL |
|------------------------------------------
| delivery_fee_id  | integer   | NOT NULL |
| delivery_day_id  | integer   | NOT NULL |
| delivery_area_id | integer   | NOT NULL |

### Associations
- has_many :buy_items


## comments

| Column     | Type      | Option   |
|------------------------------------
| users      | reference | NOT NULL |
| buy_item   | reference | NOT NULL |
| text       | text      | NOT NULL |

### Associations
- belongs_to :user
- belongs_to :buy_item


## address

|Column         | Type      | Option   |
|---------------------------------------
| postal_code   | string    | NOT NULL |
| prefecture    | string    | NOT NULL |
| city          | string    | NOT NULL |
| house_number  | string    | NOT NULL |
| phone_number  | string    | NOT NULL |
| build         | string    |          |
| users         | reference | NOT NULL |

### Association
- belongs_to :user


