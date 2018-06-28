class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      # 追加
      # NOT NULL => false
      # index指定 => true
      t.integer     :item_id,         null: false
      t.integer     :artist_id,       null: false
      t.integer     :disc_number,     null: false, index: true
      t.integer     :track_number,    null: false
      t.string      :name,            null: false, index: true
      t.integer     :length_hour,     null: false
      t.integer     :length_minute,   null: false
      t.integer     :length_second,   null: false
      
      t.timestamps
    end
  end
end
