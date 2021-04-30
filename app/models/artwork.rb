# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer          not null
#  favorite   :boolean          default(FALSE)
#
class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true
  validates :image_url, uniqueness: true
  validates :title, uniqueness: { scope: :artist_id, 
    message: "has already been used by this artist. Please choose a different one" }
  after_destroy :log_destroy_action


  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User
  
  has_many :artwork_shares,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare
  
  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

  has_many :comments,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Comment

  has_many :likes,
    as: :likeable,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :likeable_id,
    class_name: :Like
  
  has_many :likers,
    through: :likes,
    source: :liker

  has_many :artwork_collections,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkCollection

  has_many :collections,
    through: :artwork_collections,
    source: :collection

  def log_destroy_action
    puts 'Artwork destroyed'
  end 

end
