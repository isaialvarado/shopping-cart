class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  helper_method :shopping_cart

  def shopping_cart
    @cart ||=
      (Order.find_by_status("pending") || Order.shopping_cart!)
  end
end
