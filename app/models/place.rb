class Place < ApplicationRecord

  belongs_to :booking_places
  has_one_attached :photo

  validates :name, :address, :sleeping_type, :description, presence: true

end
