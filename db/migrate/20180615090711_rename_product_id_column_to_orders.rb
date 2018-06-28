class RenameProductIdColumnToOrders < ActiveRecord::Migration[5.1]
  def change
    # rename_column :orders, :product_id, :order_item_id, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC'
  end
end
