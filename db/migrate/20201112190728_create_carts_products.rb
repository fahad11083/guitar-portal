class CreateCartsProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts_products do |t|
      t.integer :cart_id, index: true
      t.integer :product_id, index:true
      t.timestamps
    end
  end
end
