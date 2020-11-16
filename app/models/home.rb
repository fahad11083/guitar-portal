class Home < ApplicationRecord
  def self.user_data(user_id)
    user = User.find_by(id: user_id)
    products = user.products.last(5)
  end
end
