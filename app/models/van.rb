class Van < ApplicationRecord

  has_many :bookings
  validates :name, :passengers, :van_type, :price_per_night, presence: true

  def self.find_from_criteria(passengers, van_type)
    all.find(passa)
  end

end
