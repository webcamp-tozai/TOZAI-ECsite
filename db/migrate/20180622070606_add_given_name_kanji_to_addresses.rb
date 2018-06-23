class AddGivenNameKanjiToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :given_name_kanji, :string, after: :family_name_kanji
  end
end
