class TimeCount < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
