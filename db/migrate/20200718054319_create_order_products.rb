class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :quantity
      t.integer :tax_price
      t.integer :producing_status
      t.integer :product_id
      t.integer :order_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
