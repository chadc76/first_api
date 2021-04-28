class AddArtisitIdToArtworks < ActiveRecord::Migration[6.1]
  def change
    add_column :artworks, :artist_id, :integer, null: false
  end
end
