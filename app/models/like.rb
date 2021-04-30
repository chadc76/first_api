# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  likeable_type :string           not null
#  likeable_id   :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer          not null
#
class Like < ApplicationRecord
  TYPES = [
    'Artwork',
    'Comment'
  ]
  validates :user_id, :likeable_type, :likeable_id, presence: true
  validates :likeable_type, inclusion: TYPES
  validates :user_id, uniqueness: { scope: [:likeable_id, :likeable_type],
  message: "has already liked this" }
  validate :access, :not_conceited

  belongs_to :likeable, 
    polymorphic: true,
    primary_key: :id,
    foreign_key: :likeable_id,
    class_name: :likeable_type.to_sym

  has_one :liker,
    primary_key: :user_id,
    foreign_key: :id,
    class_name: :User

  def access
    art = self.likeable_type == "Artwork" ? (Artwork.find(self.likeable_id)) : (Comment.find(self.likeable_id).artwork)

    unless (art.shared_viewers.map(&:id).include?(self.user_id)) || (art.artist_id == user_id)
      errors.add(:user_id, "doesn't have permission to view this artwork!")
    end
  end

  def not_conceited
    if self.likeable_type == "Artwork"
      unless self.likeable.artist_id != self.user_id
        errors.add(:user_id, "cannot like their own art!")
      end
    else
      unless self.likeable.user_id != self.user_id
        errors.add(:user_id, "cannot like their own comments!")
      end
    end
  end
end
