class Van < ApplicationRecord

  has_many :bookings

  has_one_attached :photo

  validates :name, :passengers, :van_type, :price_per_night, presence: true

  def self.find_van_from_criteria(passengers, van_type)
    all.where(passengers: passengers, van_type: van_type).first
  end

end
