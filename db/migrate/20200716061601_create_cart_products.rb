class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.integer :quantity
      t.integer :product_id
      t.integer :end_user_id

      t.timestamps
    end
  end
end
