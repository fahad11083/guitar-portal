class CartsController < ApplicationController
  def index
    @cart = Cart.find_by(user_id: current_user.id)
    @products = @cart.products if @cart.present?
  end

  def show
    @cart =  Cart.find(params[:id])
    @products = @cart.products
    @products.each do |product|
      UsersProduct.create(product_id: product.id, user_id: current_user.id)
    end
    @cart_total = Cart.cart_total(current_user.id)
    @cart.destroy
  end

  def destroy
    @cart = Cart.find_by(user_id: current_user.id)
    cart_products = @cart.carts_products
    cart_products.where(product_id: params[:id]).destroy_all
    redirect_to carts_path
  end
end
