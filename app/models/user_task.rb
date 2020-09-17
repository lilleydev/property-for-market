class UserTask < ApplicationRecord
  belongs_to :user
  belongs_to :task
  validates :finish_by, presence: true
end
