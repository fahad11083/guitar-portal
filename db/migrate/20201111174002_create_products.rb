class CreateProducts < ActiveRecord::Migration[6.0]
  def up
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :image
      t.timestamps
    end
    Product.create name: "Classical Acoustic Guitar", price: 54, image: "guitar-1.png"
    Product.create name: "Kids Electric Guitar Pack", price: 72, image: "guitar-4.jpg"
    Product.create name: "Electric Guitar", price: 399, image: "guitar-3.jpg"
    Product.create name: "z-Guitar", price: 310, image: "guitar-2.jpg"
    Product.create name: "z-Electric Guitar", price: 310, image: "guitar-5.jpg"
  end

  def down
  end
end
