class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user

  validates :title, presence: true, length: { minimum: 2, maximum: 100,
                                              too_long: '100 characters is the maximum allowed' }
  validates :text, presence: true, length: { minimum: 2, maximum: 3000,
                                             too_long: '3000 characters is the maximum allowed' }
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :image, format: { with: /\.(png|jpg|jpeg)/, message: 'must be a URL for GIF, JPG or PNG image.' }

  scope :order_by_most_recent, -> { order(created_at: :desc) }
  scope :category, ->(category_id) { where(category_id: category_id) }
  def self.last_by_category(categories, index)
    where(category_id: categories[index]).order(created_at: :desc).first
  end
end
