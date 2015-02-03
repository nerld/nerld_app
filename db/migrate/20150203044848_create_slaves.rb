class CreateSlaves < ActiveRecord::Migration
  def change
    create_table :slaves do |t|
      t.integer :address
      t.integer :s_type
      t.integer :state
      t.integer :remote_lab_id

      t.timestamps
    end
  end
end
