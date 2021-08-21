class OrdersController < ApplicationController

  def index
    @buy_address = BuyAddress.new
    @buy_item = BuyItem.find(params[:buy_item_id])
  end

  def create
  end
end
