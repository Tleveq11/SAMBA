class Activity < ApplicationRecord

  has_many :booking_activities
  has_one_attached :photo

  validates :name, :address, :category, :description, presence: true
end
