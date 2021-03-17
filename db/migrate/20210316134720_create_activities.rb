class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :address
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
