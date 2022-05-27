class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postcode
      t.string :address
      t.string :name
      t.integer :total_price
      t.integer :shipping_fee
      t.integer :payment_method, default: "0"
      t.integer :order_status, default: "0"

      t.timestamps
    end
  end
end
