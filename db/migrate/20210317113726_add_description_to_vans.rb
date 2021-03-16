class AddDescriptionToVans < ActiveRecord::Migration[6.0]
  def change
    add_column :vans, :description, :text
  end
end
