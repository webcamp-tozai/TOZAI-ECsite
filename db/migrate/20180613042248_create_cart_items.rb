class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      # 追加
      # NOT NULL => false
      # index指定 => true
      t.integer     :item_id, null: false, index: true
      t.integer     :user_id
      t.integer     :item_count
      
      t.timestamps
    end
  end
end
