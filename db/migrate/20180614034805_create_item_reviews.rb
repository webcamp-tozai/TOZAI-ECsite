class CreateItemReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :item_reviews, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      # 追加
      # NOT NULL => false
      # index指定 => true
      t.integer     :item_id, null: false, index: true
      t.integer     :user_id, null: false, index: true
      t.text        :review, null: false
      
      t.timestamps
    end
  end
end

