class Van < ApplicationRecord

  has_many :bookings

  has_one_attached :photo

  validates :name, :passengers, :van_type, :price_per_night, presence: true

  def self.find_from_criteria(passengers, van_type)
    all.find(passa)
  end

end
