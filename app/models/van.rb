class Van < ApplicationRecord

  has_many :bookings

  validates :name, :passengers, :van_type, :price_per_night, presence: true

end
