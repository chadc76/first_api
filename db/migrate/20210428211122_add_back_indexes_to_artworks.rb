class AddBackIndexesToArtworks < ActiveRecord::Migration[6.1]
  def change
    add_index :artworks, :artist_id
    add_index :artworks, [:title, :artist_id], unique: true
  end
end
