class CreateContactStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_statuses, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      # 追加
      # NOT NULL => false
      # index指定 => true
      t.integer   :admin_id, null: false, index: true
      t.string    :status, null: false, index: true
      
      t.timestamps
    end
  end
end
