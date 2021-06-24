class User < ApplicationRecord
  has_secure_password
  has_many :articles, dependent: :destroy
  has_many :votes
  validates :name, presence: true, uniqueness: true,
                   length: { maximum: 20, too_long: '20 characters is the maximum allowed' }
  validates :email, presence: true,
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }, uniqueness: true

  validates :password, length: { minimum: 6 }, presence: true
  validates :password_confirmation, length: { minimum: 6 }, presence: true
end
