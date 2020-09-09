class Realtor < ApplicationRecord
  belongs_to :user, foreign_key: 'owner_id', class_name: 'User'
  has_many :comments, through: :rooms
end
