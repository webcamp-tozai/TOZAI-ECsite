class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      # 追加
      # NOT NULL => false
      # index指定 => true
      t.integer   :contact_status_id, null: false, index: true
      t.string    :name, null: false, index: true
      t.string    :title, null: false
      t.string    :email, null: false, index: true
      t.text      :message, null: false
      
      t.timestamps
    end
  end
end
