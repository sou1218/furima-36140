class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @buy_address = BuyAddress.new
    @buy_item = BuyItem.find(params[:buy_item_id])

    if @buy_item.order.present?
      redirect_to root_path
    end

    if @buy_item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @buy_item = BuyItem.find(params[:buy_item_id])
    @buy_address = BuyAddress.new(order_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

    



private

  def order_params
    params.require(:buy_address).permit(:postal_code, :prefecture_id, :city, :house_number, :phone_number, :building).merge(user_id: current_user.id, buy_item_id: params[:buy_item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp.api_key = "sk_test_1f0fc6bc4fddacfa24ece479"
      Payjp::Charge.create(
        amount: @buy_item.price,  
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end

end


