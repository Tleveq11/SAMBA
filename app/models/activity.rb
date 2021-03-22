class Activity < ApplicationRecord

  has_many :booking_activities
  has_one_attached :photo

  validates :name, :address, :category, :description, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
