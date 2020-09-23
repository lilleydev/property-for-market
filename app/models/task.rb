class Task < ApplicationRecord
  belongs_to :room
  delegate :user, to: :room
  has_many :user_tasks, dependent: :destroy
  has_many :helpers, through: :user_tasks, source: :user
  scope :needs_help, -> { where(needs_help: true) }

  validates :name, presence: true
  validates :description, presence: true
end
