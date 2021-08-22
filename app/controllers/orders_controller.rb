class OrdersController < ApplicationController

  def index
    @buy_address = BuyAddress.new
    @buy_item = BuyItem.find(params[:buy_item_id])
  end

  def create
    @buy_item = BuyItem.find(params[:buy_item_id])
    @buy_address = BuyAddress.new(order_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end



private

  def order_params
    params.require(:buy_address).permit(:postal_code, :prefecture_id, :city, :house_number, :phone_number).merge(user_id: current_user.id, buy_item_id: params[:buy_item_id])
  end

end


