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

  belongs_to :likeable, 
    polymorphic: true,
    primary_key: :id,
    foreign_key: :likeable_id,
    class_name: :likeable_type.to_sym

  has_one :liker,
    primary_key: :user_id,
    foreign_key: :id,
    class_name: :User
end
