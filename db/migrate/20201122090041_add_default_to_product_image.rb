class AddDefaultToProductImage < ActiveRecord::Migration[6.0]
  def up
    change_column :products, :image, :string, default: 'default.jpg'
  end

  def down
    change_column :products, :image, :string
  end
end
