class Flat < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :bookings, dependent: :destroy
  has_many :lodgers, through: :bookings, source: :user
  has_many_attached :photos

  geocoded_by :address
  # only geocode when address changes
  after_validation :geocode, if: :will_save_change_to_address?
end
