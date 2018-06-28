class CreateLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :labels, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      # 追加
      # NOT NULL => false
      # index指定 => true
      t.string      :name, null: false
      t.timestamps
    end
  end
end
