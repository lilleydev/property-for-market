class Realtor < ApplicationRecord
  belongs_to :owner
  has_many :comments, through: :rooms
end
