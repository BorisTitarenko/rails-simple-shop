load "current_cart"
class RegistrationsController < Devise::RegistrationsController
  include SetCart

  protected

  def sign_up(_resource_name, user)
    super
    current_cart
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
