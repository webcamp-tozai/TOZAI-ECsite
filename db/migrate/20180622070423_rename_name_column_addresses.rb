class RenameNameColumnAddresses < ActiveRecord::Migration[5.1]
  def change
    rename_column :addresses, :name, :family_name_kanji
  end
end
