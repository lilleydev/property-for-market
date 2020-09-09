class Room < ApplicationRecord
  has_many :comments
  has_many :tasks, dependent: :destroy
  belongs_to :user
end
