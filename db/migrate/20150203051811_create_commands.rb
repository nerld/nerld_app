class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.boolean :completed, :default => false
      t.integer :slave_id
      t.integer :input
      t.timestamps
    end
  end
end
