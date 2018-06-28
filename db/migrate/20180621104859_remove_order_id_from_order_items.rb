class RemoveOrderIdFromOrderItems < ActiveRecord::Migration[5.1]
  def change
  	# remove_column :order_items, :order_id, :intege, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC'
  	# add_column :order_items, :order_id, :integer, after: :id, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC'
  end
end
