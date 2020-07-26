class ChangeIsActiveToEndUser < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :end_users, :is_active, false
  	change_column_null :genres, :is_active, false
  	change_column_null :products, :is_active, true
  	change_column_default :products, :is_active, nil

  end


end
