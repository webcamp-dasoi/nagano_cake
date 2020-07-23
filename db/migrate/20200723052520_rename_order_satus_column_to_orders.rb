class RenameOrderSatusColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :order_satus, :order_status
  end
end
