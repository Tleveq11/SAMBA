class CreateBookingActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_activities do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
