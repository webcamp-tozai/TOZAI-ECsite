class RemoveOrderIdFromOrderItems < ActiveRecord::Migration[5.1]
  def change
  	remove_column :order_items, :order_id, :integer
  	add_column :order_items, :order_id, :integer, after: :id
  end
end
