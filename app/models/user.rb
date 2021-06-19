class User < ApplicationRecord
  has_secure_password
  has_many :articles, dependent: :destroy
  has_many :votes
end
