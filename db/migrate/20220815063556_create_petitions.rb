class CreatePetitions < ActiveRecord::Migration[7.0]
  def change
    create_table :petitions do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :state

      t.timestamps
    end
  end
end
