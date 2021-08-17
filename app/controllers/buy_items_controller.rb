class BuyItemsController < ApplicationController

  before_action :set_message, only: [:create, :new]

  def index
    @buy_items = BuyItem.order(id: "DESC")
  end

  def new
    @buy_item = BuyItem.new
  end

  def create
    @buy_item = BuyItem.new(buy_item_params)
    if @buy_item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @buy_item = BuyItem.find(params[:id])
  end

  def edit
    @buy_item = BuyItem.find(params[:id])
    unless @buy_item.user == current_user
      redirect_to root_path
    end
  end

  def update
    @buy_item = BuyItem.find(params[:id])
    if @buy_item.update(buy_item_params)
      redirect_to buy_item_path
    else
      render :edit
    end
  end


  private

  def buy_item_params
    params.require(:buy_item).permit(:image, :name, :price, :experience, :condition_id,  :delivery_fee_id, :delivery_day_id, :category_id, :prefecture_id).merge(user_id: current_user.id)
  end

  def set_message
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
