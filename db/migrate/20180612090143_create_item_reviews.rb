class CreateItemReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :item_reviews do |t|
      # 追加
      # NOT NULL => false
      # index指定 => true
      t.integer     :item_id, null: false, index: true
      t.integer     :user_if, null: false, index: true
      t.text        :review,  null: false, index: true
      t.timestamps
    end
  end
end
