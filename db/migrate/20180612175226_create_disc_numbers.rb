class CreateDiscNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :disc_numbers do |t|
      # 追加
      # NOT NULL => false
      # index指定 => true
      t.integer :number, null: false
      
      t.timestamps
    end
  end
end
