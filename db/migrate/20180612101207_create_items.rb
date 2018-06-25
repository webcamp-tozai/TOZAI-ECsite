class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      # 追加
      # NOT NULL => false
      # index指定 => true
      t.integer   :item_review_id,                  index: true
      t.integer   :track_id,          null: false,  index: true
      t.integer   :disc_number_id,    null: false,  index: true
      t.integer   :label_id,          null: false,  index: true
      t.integer   :artist_id,         null: false,  index: true
      t.integer   :genre_id,          null: false,  index: true
      t.text      :item_introduction
      t.string    :title,             null: false,  index: true
      t.text      :image_id,          null: false # refile用
      t.integer   :stock,             null: false
      t.integer   :price_without_tax, null: false
      t.string    :type,              null: false
      t.boolean   :is_deleted,        null: false,  default: false
      t.timestamps
    end
  end
end
