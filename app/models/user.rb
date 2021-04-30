# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork

  has_many :artwork_shares,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

  has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork

  has_many :comments,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Comment

  has_many :likes,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Like

  has_many :liked_comments,
    through: :comments,
    source: :likes

  has_many :liked_artworks,
    through: :artworks,
    source: :likes

  has_many :collections,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Collection
end
