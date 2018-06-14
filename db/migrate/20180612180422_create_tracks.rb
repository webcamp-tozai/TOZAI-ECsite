class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      # 追加
      # NOT NULL => false
      # index指定 => true
      t.integer     :disc_number_id,  null: false, index: true
      t.integer     :number,          null: false
      t.string      :name,            null: false, index: true
      t.integer     :length_hour,     null: false, default: 0
      t.integer     :length_minute,   null: false
      t.integer     :length_second,   null: false
      
      t.timestamps
    end
  end
end
