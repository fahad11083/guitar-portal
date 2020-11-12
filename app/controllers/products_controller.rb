class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @product_user = UsersProduct.create(product_id: @product.id, user_id: current_user.id)
    redirect_to products_path
  end
end
