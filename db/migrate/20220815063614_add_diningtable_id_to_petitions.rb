class AddDiningtableIdToPetitions < ActiveRecord::Migration[7.0]
  def change
    add_reference :petitions, :diningtable, null: false, foreign_key: true
  end
end
