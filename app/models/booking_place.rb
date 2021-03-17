class BookingPlace < ApplicationRecord

  belongs_to :place
  belongs_to :booking

end
