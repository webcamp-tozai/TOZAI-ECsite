class CreateGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :genres, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      # 追加
      # NOT NULL => false
      # index指定 => true
      t.string      :genre_english, null: false, index: true
      t.string      :genre_kana,    null: false, index: true
      
      t.timestamps
    end
  end
end
