class CreateCartProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_products do |t|
      t.integer :customer_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
