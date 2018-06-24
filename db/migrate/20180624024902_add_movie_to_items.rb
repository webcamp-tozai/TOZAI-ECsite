class AddMovieToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :movie, :string
  end
end
