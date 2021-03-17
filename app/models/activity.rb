class Activity < ApplicationRecord

  belongs_to :booking_activities
  has_one_attached :photo

  validates :name, :address, :category, :description, presence: true

end
