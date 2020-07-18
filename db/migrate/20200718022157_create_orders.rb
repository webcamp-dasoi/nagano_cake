class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :payment_method
      t.string :shipping_name
      t.string :shipping_post_number
      t.string :shipping_address
      t.integer :shipping_cost
      t.integer :total_price
      t.integer :order_satus, defalut: 0
      t.integer :end_user_id

      t.timestamps
    end
  end
end
