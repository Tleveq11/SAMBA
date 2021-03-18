class Place < ApplicationRecord

  has_many :booking_places
  has_one_attached :photo

  validates :name, :address, :sleeping_type, :description, presence: true

end
