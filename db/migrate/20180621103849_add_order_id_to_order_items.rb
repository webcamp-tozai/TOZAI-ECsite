class AddOrderIdToOrderItems < ActiveRecord::Migration[5.1]
  def change
  	add_column :order_items, :order_id, :integer
  	remove_column :orders, :order_item_id, :integer
  end
end
