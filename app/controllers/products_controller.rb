class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart = Cart.find_or_create_by(user_id: current_user.id)
    @cart_products = @cart.carts_products.create(product_id: @product.id)
    redirect_to products_path
  end
end
