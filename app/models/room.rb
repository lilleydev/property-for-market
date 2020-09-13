class Room < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
end
