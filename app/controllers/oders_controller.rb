class OdersController < ApplicationController

  def index
    @buy_address = BuyAddress.all
  end

  def create
  end
end
