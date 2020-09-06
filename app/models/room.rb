class Room < ApplicationRecord
  has_many :comments, through: :realtors
  has_many :tasks
  belongs_to :owner
end
