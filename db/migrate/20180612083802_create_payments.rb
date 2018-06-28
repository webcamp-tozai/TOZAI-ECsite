class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      # 追加
      # NOT NULL => false
      # index指定 => true
      t.string      :payment_method, null: false, index: true
      t.timestamps
    end
  end
end
