class Message < ApplicationRecord
  validates :body, :user_token, :user_name, presence: true
  validates :user_token, uniqueness: true
end
