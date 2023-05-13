class AddUniqueIndexToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_index :favorites, [:user_id, :annonce_id], unique: true
  end
end
