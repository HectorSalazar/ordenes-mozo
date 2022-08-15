class AddHallIdToDiningtables < ActiveRecord::Migration[7.0]
  def change
    add_reference :diningtables, :hall, null: false, foreign_key: true
  end
end
