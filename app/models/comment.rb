# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  artwork_id :integer          not null
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
  validates :artwork_id, :user_id, :body, presence: true
  validate :access
  after_destroy :log_destroy_action

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork

  has_many :likes,
    as: :likeable,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :likeable_id,
    class_name: :Like

  has_many :likers,
    through: :likes,
    source: :liker

  def access
    art = Artwork.find(artwork_id)
    if (art.artist_id == user_id)
      return
    elsif (art.shared_viewers.map(&:id).include?(self.user_id))
      return
    else
      errors.add(:user_id, "doesn't have permission to view this artwork!")
    end
  end

  def log_destroy_action
    puts 'Comment destroyed'
  end 

end
