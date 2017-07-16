class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :license_plate
      t.string :color
      t.string :year
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
