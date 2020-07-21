class AddColumnToEndUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :end_users, :last_name, :string
  	add_column :end_users, :first_name, :string
  	add_column :end_users, :kana_last_name, :string
  	add_column :end_users, :kana_first_name, :string
  	add_column :end_users, :post_number, :string
  	add_column :end_users, :address, :string
  	add_column :end_users, :telephone_number, :string
  	add_column :end_users, :is_active, :boolean, default: true

  end
end
