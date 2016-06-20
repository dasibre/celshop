class CartsController < ApplicationController

  def show
    @order_items = find_order(session[:order_id])
  end


  private

  def find_order(id)
    Order.find(id)
  end
end
