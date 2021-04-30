# == Schema Information
#
# Table name: artwork_collections
#
#  id            :bigint           not null, primary key
#  collection_id :integer          not null
#  artwork_id    :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class ArtworkCollection < ApplicationRecord
  validates :collection_id, :artwork_id, presence: true
  validates :artwork_id, uniqueness: {scope: :collection_id,
    message: "has already been added to this collection!"}
  validate :access

  belongs_to :collection,
    primary_key: :id,
    foreign_key: :collection_id,
    class_name: :Collection

  has_one :artwork,
    primary_key: :artwork_id,
    foreign_key: :id,
    class_name: :Artwork
  
  def access
    art = Artwork.find(artwork_id)
    user_id = Collection.find(collection_id).owner.id
    if (art.artist_id == user_id)
      return
    elsif (art.shared_viewers.map(&:id).include?(user_id))
      return
    else
      errors.add(:user_id, "doesn't have permission to add this artwork to their collection!")
    end
  end
  
end
