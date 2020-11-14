class Cart < ApplicationRecord
  has_many :carts_products
  has_many :products, through: :carts_products

  belongs_to :user

  def self.cart_count(user_id)
    cart = self.find_by(user_id: user_id)
    cart.products.count
  end

  def self.cart_total(user_id)
    cart = self.find_by(user_id: user_id)
    total = 0
    products = cart.products
    products.each do |product|
      total += product.price
    end
    total
  end
end
