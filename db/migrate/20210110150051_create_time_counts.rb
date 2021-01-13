class CreateTimeCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :time_counts do |t|
      t.datetime :punch_in_time
      t.datetime :punch_out_time
      t.boolean :active, defult: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
