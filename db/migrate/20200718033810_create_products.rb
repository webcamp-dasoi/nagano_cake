class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :introduction
      t.integer :non_tax_price
      t.string :image_id
      t.boolean :is_active
      t.integer :genre_id

      t.timestamps
    end
  end
end
