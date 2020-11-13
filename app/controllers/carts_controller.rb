class CartsController < ApplicationController
  def index
    @cart = Cart.find_by(user_id: current_user.id)
    @products = @cart.products
  end
end
