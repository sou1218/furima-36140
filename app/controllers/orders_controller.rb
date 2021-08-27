class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:index, :create]
  before_action :if_message, only: [:index, :create]

  def index
    @buy_address = BuyAddress.new
  end

  def create
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

  def set_message
    @buy_item = BuyItem.find(params[:buy_item_id])
  end

  def if_message
    if @buy_item.order.present?
      redirect_to root_path
      return
    end

    if @buy_item.user_id == current_user.id
      redirect_to root_path
      return
    end
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
      Payjp::Charge.create(
        amount: @buy_item.price,  
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end 

  

end


