class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      # 追加
      # NOT NULL => false
      # index指定 => tru
      t.integer   :order_id, null: false, index: true
      t.integer   :item_id, null: false, index: true
      t.integer   :item_count, null: false
      t.integer   :total_price_without_tax, null: false
      
      t.timestamps
    end
  end
end
