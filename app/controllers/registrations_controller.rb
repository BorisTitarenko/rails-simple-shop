load "current_cart"
class RegistrationsController < Devise::RegistrationsController
  include SetCart
  before_action :current_cart

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
