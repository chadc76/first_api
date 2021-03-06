class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.timestamps
    end
    add_index :collections, :user_id
    add_index :collections, [:user_id, :name], unique: true
  end
end
