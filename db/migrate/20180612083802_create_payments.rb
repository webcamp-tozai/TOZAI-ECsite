class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      # 追加
      # NOT NULL => false
      # index指定 => true
      t.string      :payment_method, null: false, index: true
      t.timestamps
    end
  end
end
