class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_one :owner, through: :flat
end
