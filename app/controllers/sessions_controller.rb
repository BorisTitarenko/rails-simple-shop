
class SessionsController < Devise::SessionsController
  after_action :after_login, :only => :create

  private

  def after_login
    last = current_user.orders&.last
    if last.status == 'empty' || last.status == 'cart'
      session[:cart_token] = last.token
    end
  end
end
