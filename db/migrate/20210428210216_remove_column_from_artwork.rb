class RemoveColumnFromArtwork < ActiveRecord::Migration[6.1]
  def up
    remove_column :artworks, :artist_id
  end

  def down
    add_column :artworks, :artist_id, :string, null: false
  end
end
