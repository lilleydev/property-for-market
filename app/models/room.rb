class Room < ApplicationRecord
  has_many :tasks, -> { order('created_at DESC') }, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
end
