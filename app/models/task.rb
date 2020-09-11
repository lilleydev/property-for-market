class Task < ApplicationRecord
  belongs_to :room
  delegate :user, to: :room
  has_many :user_tasks
  has_many :helpers, through: :user_tasks, source: :user
  # scope :less_than_3_helpers, -> { joins(:user_tasks).group('tasks.id').having('count(task_id) < 2') }
  scope :needs_help, -> { where(needs_help: true) }

  validates :name, presence: true
  validates :description, presence: true
  # needs_help.select do |t|
  #   t.helpers.count < 2
  # end
end
