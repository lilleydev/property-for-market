class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2]

  has_many :rooms, -> { order('created_at DESC') }
  has_many :tasks, through: :rooms
  has_many :user_tasks
  has_many :helped_tasks, through: :user_tasks, source: :task
  has_many :helpers, through: :tasks

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    user ||= User.create(first_name: data['first_name'],
                         last_name: data['last_name'],
                         email: data['email'],
                         password: Devise.friendly_token[0, 20])
    user
end
end
