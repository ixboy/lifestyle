class User < ApplicationRecord
  has_secure_password
  has_many :articles, dependent: :destroy
  has_many :votes
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 30,
                                                               too_long: '30 characters is the maximum allowed' }
end
