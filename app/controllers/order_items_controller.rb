class OrderItemsController < ApplicationController
  def index
    @order_items = current_cart.order.order_items
  end

  def create
    @order_item = current_cart.add_instrument(params[:instrument_id])
    redirect_to order_items_path
  end

  def destroy
    current_cart.destroy_item(params[:id])
    redirect_to order_items_path
  end

end
