class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :seats_number
      t.string :transmision
      t.string :mileage
      t.string :image
      t.float :price_for_day
      t.integer :bags_number

      t.timestamps
    end
  end
end
