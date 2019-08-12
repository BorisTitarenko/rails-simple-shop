class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_cart

  def index
    @orders = Order.where.not(token: current_cart.token)
  end

  def checkout
    @order = current_cart.order
  end

  def create
    @order = current_cart.order
    if @order.update_attributes!(order_params.merge(status: 'open'))
      redirect_to root_path
    else
      render "/new"
    end
  end

  def order_params
    params.require(:order).permit(:name, :adress)
  end

end