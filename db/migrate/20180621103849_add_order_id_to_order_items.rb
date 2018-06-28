class AddOrderIdToOrderItems < ActiveRecord::Migration[5.1]
  def change
  	# add_column :order_items, :order_id, :integer, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC'
  	# remove_column :orders, :order_item_id, :integer, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC'
  end
end
