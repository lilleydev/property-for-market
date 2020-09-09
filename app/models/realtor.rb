class Realtor < ApplicationRecord
  belongs_to :user
  has_many :comments, through: :rooms
end
