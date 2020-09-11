class Room < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :tasks, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
end
