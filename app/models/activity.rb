class Activity < ApplicationRecord

  belongs_to :booking_activities

  validates :name, :address, :category, :description, presence: true

end
