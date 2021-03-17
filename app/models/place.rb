class Place < ApplicationRecord

  belongs_to :booking_places

  validates :name, :address, :sleeping_type, :description, presence: true

end
