class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @products = Product.all
  end

  def show
    if current_user.present?
      @product = Product.find(params[:id])
      @cart = Cart.find_or_create_by(user_id: current_user.id)
      @cart_products = @cart.carts_products.create(product_id: @product.id)
    end
    redirect_to products_path
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:id, :name, :price, :image)
  end
end
