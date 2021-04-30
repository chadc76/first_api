class CreateArtworkCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :artwork_collections do |t|
      t.integer :collection_id, null: false
      t.integer :artwork_id, null: false
      t.timestamps
    end
    add_index :artwork_collections, :collection_id
    add_index :artwork_collections, :artwork_id
    add_index :artwork_collections, [:collection_id, :artwork_id], unique: true
  end
end
