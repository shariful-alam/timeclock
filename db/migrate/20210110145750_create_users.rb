class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :date_of_birth
      t.string :tracker_id


      t.timestamps
    end
  end
end
