class BuyItemsController < ApplicationController
  def index
    
  end

  def new
    @buy_items = BuyItem.new
  end

  def create
    @buy_item = BuyItem.new(buy_item_params)
  end

  private
  def buy_item_params
    params.require(:buy_item).permit(:name, :price, :experience, :condition_id, :delivery_id, :delivery_fee_id, :delivery_day_id, :category_id)
  end
end
