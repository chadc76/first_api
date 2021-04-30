# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  favorite   :boolean          default(FALSE)
#
class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true
  validates :artwork_id, uniqueness: { scope: :viewer_id, 
    message: "has already been shared with this artist" }
  validate :not_self_share

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork

  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User

  def not_self_share
    art = Artwork.find(artwork_id)
    unless art.artist_id != viewer_id
      errors.add(:artwork_id, "cannot be shared with Artist")
    end
  end
end
