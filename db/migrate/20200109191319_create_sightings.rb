class CreateSightings < ActiveRecord::Migration[6.0]
  def change
    create_table :sightings do |t|
      t.string :date
      t.string :latitude
      t.string :longitude
      t.integer :animal_id

      t.timestamps
    end
  end
end
