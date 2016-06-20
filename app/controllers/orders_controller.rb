class OrdersController < ApplicationController
  def create
    @order = current_order
    @order.add_item(params[:id])
    @order.save
    session[:order_id] = @order.id
  end

  def update
  end

  def destroy
  end


end
