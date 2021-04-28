class AddColumnToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :user_id, :integer, null: false
    add_index :likes, :user_id
    add_index :likes, [:user_id, :likeable_type, :likeable_id], unique: true
  end
end
