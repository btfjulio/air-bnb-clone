class Flat < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :bookings
  has_many :lodgers, through: :bookings, source: :user

  has_many_attached :photos
end
