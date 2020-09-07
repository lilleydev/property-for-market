class Room < ApplicationRecord
  has_many :comments, through: :realtors
  has_many :tasks, dependent: :destroy
  belongs_to :user
end
