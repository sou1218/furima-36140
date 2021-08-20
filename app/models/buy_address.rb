class BuyAddress 
  include ActiveModel::Model
  attr_accessor :user_id, :buy_item_id, :postal_code, :prefecture, :city, :house_number, :phone_number, :building

  with_options presence: true do
    validates :user_id
    validates :buy_item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blanck"}
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{11}\z/}
  end

  def save
    buy_info = BuyInfo.create(buy_item_id: buy_item_id, user_id: user_id)

    shopping_address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, building: building, house_number: house_number, phone_number: phone_number, buy_info_id: buy_info.id)

end
