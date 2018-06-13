class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      # 追加
      # NOT NULL => false
      # index指定 => true
      t.integer     :product_id,  null: false, index: true
      t.integer     :user_id,     null: false
      t.integer     :address_id,  null: false
      t.integer     :payment_id,  null: false
      t.string      :status,      null: false, index: true
      t.integer     :total_count, null: false
      t.integer     :total_price_without_tax, null: false
      t.integer     :total_price, null: false
      
      t.timestamps
    end
  end
end
