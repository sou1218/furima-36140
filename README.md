#テーブル設計

## usersテーブル

| Column             | Type    | Option   |
|------------------------------------------
| nickname           | string  | NOT NULL |
| email              | string  | NOT NULL |
| encrypted_password | string  | NOT NULL |
| family_name        | string  | NOT NULL |
| family_name_kana   | string  | NOT NULL |
| first_name         | string  | NOT NULL |
| first_name_kana    | string  | NOT NULL |
| birthday_yy        | integer | NOT NULL |
| birthday_mm        | integer | NOT NULL |
| birthday_dd        | integer | NOT NULL |

### Associations

## itemsテーブル

|Column         | Type      | Option   |
|---------------------------------------
| image         | image     | NOT NULL |
| name          | string    | NOT NULL |
| price         | integer   | NOT NULL |
| delivery_fee  | reference | NOT NULL |
| delivery_days | reference | NOT NULL |
| delivery_area | reference | NOT NULL |
| condition     | reference | NOT NULL |
| experience    | text      | NOT NULL |
| user          | reference | NOT NULL |

### Associations 

## comments

| Column | Type      | Option   |
|--------------------------------
| user   | reference | NOT NULL |
| item   | reference | NOT NULL |
| text   | text      | NOT NULL |

### Associations

## address

|Column         | Type      | Option   |
|---------------------------------------
| postal_code   | integer   | NOT NULL |
| prefecture    | string    | NOT NULL |
| city          | string    | NOT NULL |
| house_number  | integer   | NOT NULL |
| phone_number  | integer   | NOT NULL |
| build         | string    |          |
| user          | reference | NOT NULL |

### Association

## credit

| Column        | Type      | Option   |
|---------------------------------------
| card_number   | integer   | NOT NULL |
| time_limit_yy | integer   | NOT NULL |
| time_limit_mm | integer   | NOT NULL |
| security_code | integer   | NOT NULL |
| user          | reference | NOT NULL |

### Association