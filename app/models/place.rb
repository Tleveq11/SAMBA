class Place < ApplicationRecord

  has_many :booking_places
  has_one_attached :photo

  validates :name, :address, :sleeping_type, :description, presence: true


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
