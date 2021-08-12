require 'rails_helper'

RSpec.describe BuyItem, type: :model do
  describe '#create' do
    before do
      @buy_item = FactoryBot.build(:buy_item)
    end
  
    context '出品できるとき' do
      it '全ての要素が入力されていれば出品できる' do
        expect(@buy_item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'imageが空では出品できない' do
        @buy_item.image = nil
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では出品できない' do
        @buy_item.name = ''
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Name can't be blank")
      end

      it 'experienceが空で出品できない' do
        @buy_item.experience = ''
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Experience can't be blank")
      end

      it 'category_idが１では出品できない' do
        @buy_item.category_id = 1
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Category can't be blanck")
      end

      it 'condition_idが１では出品できない' do
        @buy_item.condition_id = 1
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Condition can't be blanck")
      end

      it 'delivery_fee_idが１では出品できない' do
        @buy_item.delivery_fee_id = 1
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Delivery fee can't be blanck")
      end

      it 'delivery_day_idが１では出品できない' do
        @buy_item.delivery_day_id = 1
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Delivery day can't be blanck")
      end

      it 'prefecture_idが１では出品できない' do
        @buy_item.prefecture_id = 1
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Prefecture can't be blanck")
      end

      it 'priceが空では出品できない' do
        @buy_item.price = ''
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'nameが４１文字以上では出品できない' do
        @buy_item.name = 'a' * 41
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end

      it 'experienceが１００１文字以上では出品できない' do
        @buy_item.experience =  'a' * 1001
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Experience is too long (maximum is 1000 characters)")
      end

      it 'priceが数字以外では出品できない' do
        @buy_item.price = 'a'
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが300~9999999でないと出品できない' do
        @buy_item.price = 200
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
