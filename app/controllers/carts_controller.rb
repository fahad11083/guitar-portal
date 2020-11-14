class CartsController < ApplicationController
  def index
    @cart = Cart.find_by(user_id: current_user.id)
    @products = @cart.products
  end

  def show
    @cart =  Cart.find(params[:id])
    @products = @cart.products
    @products.each do |product|
      UsersProduct.create(product_id: product.id, user_id: current_user.id)
    end
    @cart.destroy
  end
end
