class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :sleeping_type
      t.text :description

      t.timestamps
    end
  end
end
