class CurrentCart

  def initialize(token: token, user_id: user_id)
    @token = token
    @user_id = user_id
  end

  def token
    @token
  end

  def order
    @order ||= Order.find_or_create_by(token: @token, user_id: @user_id) do |o|
      o.sub_total = 0
      o.status = 'empty'
    end
  end

  def add_instrument(instrument_id)
    instrument = Instrument.find(instrument_id)
    instrument.update!(status: 'in cart')

    order.order_items.create(instrument_id: instrument_id, price: instrument.price)
    update_sub_total!
  end

  def destroy_item(order_item_id)
    item = order.order_items.find(order_item_id)
    if item
      item.destroy
      update_sub_total!
    end
  end

  private
  def update_sub_total!
    order.update_attributes!(sub_total: order.order_items.sum(:price))
  end

end



module SetCart
  def current_cart
    if user_signed_in?
       @current_cart ||= CurrentCart.new(token: cart_token, user_id: current_user.id)
    else
      flash.now[:alert] = "You are not signed in"
      redirect_to new_user_session_path
    end
  end

  def cart_token
    return session[:cart_token] if session[:cart_token]
    session[:cart_token] ||= SecureRandom.hex(8)
    return @cart_token = session[:cart_token]
  end
end