class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      # 追加
      # NOT NULL => false
      # index指定 => true
      t.integer   :user_id,   null: false, index: true
      t.string    :family_name_kanji,      null: false
      t.string    :given_name_kanji,       null: false
      t.string    :post_code, null: false
      t.string    :address,   null: false, index: true
      t.timestamps
    end
  end
end
