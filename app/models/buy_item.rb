class BuyItem < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition_id
  belongs_to :delivery_fee_id
  belongs_to :delivery_day_id
  belongs_to :prefecture_id
  belongs_to :category_id

  with_options numericality: { other_than: 1, message: "can't be blanck"} do
    validates :condition_id
    validates :delivery_day_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :category_id
  end

  with_options presence: true do
    validates :name
    validates :price,           format: {with: /\A^[0-9]+$\z/}
    validates :experience
    validates :condition_id
    validates :prefecture_id
    validates :category_id
    validates :delivery_day_id
    validates :delivery_fee_id
  end

    validates_inclusion_of :price, in:300..9999999

end
