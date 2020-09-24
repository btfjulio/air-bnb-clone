class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :flats, inverse_of: :owner
  has_many :rented_flats, through: :bookings, source: :flats
  has_many :bookings
  has_one_attached :photo

  def full_name
    "#{first_name} #{last_name}"
  end

end
