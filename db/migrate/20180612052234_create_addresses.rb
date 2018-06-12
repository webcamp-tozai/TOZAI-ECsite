class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      # 追加
      # NOT NULL => false
      # index指定 => true
      t.integer   :user_id,   null: false, index: true
      t.string    :name,      null: false
      t.string    :post_code, null: false
      t.string    :address,   null: false, index: true
      t.timestamps
    end
  end
end
