class CreateHalls < ActiveRecord::Migration[7.0]
  def change
    create_table :halls do |t|
      t.integer :rows
      t.integer :columns

      t.timestamps
    end
  end
end
