class CreateVans < ActiveRecord::Migration[6.0]
  def change
    create_table :vans do |t|
      t.string :name
      t.string :van_type
      t.integer :passengers
      t.integer :price_per_night

      t.timestamps
    end
  end
end
