class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      # 追加
      # NOT NULL => false
      # index指定 => true
      # t.integer     :track_id,  null: false, index: true
      t.string      :name,      null: false, index: true
      t.string      :name_kana, null: false, index: true
      t.timestamps
    end
  end
end
