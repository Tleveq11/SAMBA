class Van < ApplicationRecord

  has_many :bookings
  has_one_attached :photo

  validates :name, :passengers, :van_type, :price_per_night, presence: true

end
