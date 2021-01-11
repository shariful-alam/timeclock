class User < ApplicationRecord
  has_many :time_counts

  after_create :generate_tracker_id

  private

  def generate_tracker_id
    tracker_id = rand(10000..10000000).to_s
    self.update(tracker_id: "#{tracker_id}_#{self.id}")
  end
end
