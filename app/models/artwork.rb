# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true
  validates :title, uniqueness: { scope: :artist_id, 
    message: "has already been used by this artist. Please choose a different one" }

  belongs_to :artist,
    foreign_key: :artist_id,
    primary_key: :id,
    class_name: :User
end
