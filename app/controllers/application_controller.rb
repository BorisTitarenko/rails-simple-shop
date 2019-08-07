load 'current_cart'
class ApplicationController < ActionController::Base
  include SetCart
  helper_method :current_cart
end
