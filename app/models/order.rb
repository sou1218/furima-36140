class Order < ApplicationRecord
  belongs_to :buy_item
  has_one :shopping_address
  belongs_to :user
end
