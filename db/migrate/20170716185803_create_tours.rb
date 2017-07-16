class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.integer :vehicle_id
      t.integer :passenger_id
      t.string :from
      t.string :to

      t.timestamps null: false
    end
  end
end
