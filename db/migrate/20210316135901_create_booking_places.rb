class CreateBookingPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_places do |t|
      t.references :place, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
