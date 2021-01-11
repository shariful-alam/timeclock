class AddTotalTimeToTimeCounts < ActiveRecord::Migration[6.1]
  def change
    add_column :time_counts, :total_time, :integer
  end
end
