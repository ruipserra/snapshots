class CreateSnapshots < ActiveRecord::Migration[5.0]
  def change
    create_table :snapshots do |t|
      t.integer :seconds, null: false

      t.timestamps
    end
  end
end
