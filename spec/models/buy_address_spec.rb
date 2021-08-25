require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      buy_item = FactoryBot.create(:buy_item)
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id, buy_item_id: buy_item.id)
      sleep(1)
    end

    context '購入できるとき' do
      it '全ての要素が入力されていれば購入できる' do
        expect(@buy_address).to be_valid
      end

      it 'buildingはなくても購入できる' do
        @buy_address.building = ''
        expect(@buy_address).to be_valid
      end
    end

    context '購入できないとき' do
      it 'postal_codeがないと購入できない' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが3桁ハイフン4桁の半角文字列でないと購入できない' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが１では購入できない' do
        @buy_address.prefecture_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture can't be blanck")
      end

      it 'phone_numberがないと購入できない' do
        @buy_address.phone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁以上11桁以下の半角数字でないと購入できない' do
        @buy_address.phone_number = '090-1234-5678'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'house_numberが空では購入できない' do
        @buy_address.house_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("House number can't be blank")
      end

      it "tokenが空では購入できない" do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
