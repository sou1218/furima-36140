class BuyItem < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :delivery_day
  belongs_to :prefecture
  belongs_to :category

  with_options numericality: { other_than: 1, message: "can't be blanck"} do
    validates :condition_id
    validates :delivery_day_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :category_id
  end

  with_options presence: true do
    validates :image
    validates :name,            length: {maximum: 40}
    validates :price,           format: {with: /\A^[0-9]+$\z/}
    validates :experience,      length: {maximum: 1000}
    validates :condition_id
    validates :prefecture_id
    validates :category_id
    validates :delivery_day_id
    validates :delivery_fee_id
  end

    validates_inclusion_of :price, in:300..9999999

end
