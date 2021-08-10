class BuyItemsController < ApplicationController
  def index
    
  end

  def new
    @buy_item = BuyItem.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    @buy_item = BuyItem.new(buy_item_params)
    if @buy_item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def buy_item_params
    params.require(:buy_item).permit(:image, :name, :price, :experience, :condition_id, :delivery_id, :delivery_fee_id, :delivery_day_id, :category_id)
  end
end
