class AddWaiterIdToPetitions < ActiveRecord::Migration[7.0]
  def change
    add_reference :petitions, :waiter, null: false, foreign_key: true
  end
end
