class Booking < ApplicationRecord

  belongs_to :user
  belongs_to :van

  has_many :booking_activities
  has_many :activities, through: :booking_activities

  has_many :booking_places
  has_many :places, through: :booking_places

  validates :start_date, :end_date, :total_price, presence: true

  monetize :price_cents

end
