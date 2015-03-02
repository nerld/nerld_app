class CreateDataValues < ActiveRecord::Migration
  def change
    create_table :data_values do |t|
      t.integer :slave_id
      t.string :value

      t.timestamps
    end
  end
end
