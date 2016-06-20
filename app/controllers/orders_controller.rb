class OrdersController < ApplicationController
  def create
    @order = current_order
    @order.add_item(params[:id])
    @order.save
    session[:order_id] = @order.id
    render json: order_items_count
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    redirect_to cart_path
  end
end
