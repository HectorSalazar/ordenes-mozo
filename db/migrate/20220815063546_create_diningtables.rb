class CreateDiningtables < ActiveRecord::Migration[7.0]
  def change
    create_table :diningtables do |t|
      t.integer :position
      t.integer :state

      t.timestamps
    end
  end
end
