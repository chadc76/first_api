# == Schema Information
#
# Table name: collections
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Collection < ApplicationRecord
  validates :user_id, :name, presence: true
  validates :name, uniqueness: {scope: :user_id,
    message: "is already being used for one of your collections. Please choode another name!"}
  after_destroy :log_destroy_action
  

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :artwork_collections,
    primary_key: :id,
    foreign_key: :collection_id,
    class_name: :ArtworkCollection
  
  has_many :artworks,
    through: :artwork_collections,
    source: :artwork
  
  def log_destroy_action
    puts 'Collection destroyed'
  end 

end
