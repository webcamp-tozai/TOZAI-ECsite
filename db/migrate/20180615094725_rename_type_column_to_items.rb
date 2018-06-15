class RenameTypeColumnToItems < ActiveRecord::Migration[5.1]
  def change
    rename_column :items, :type, :content_type
  end
end
