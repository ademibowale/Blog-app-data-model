class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,stretches: 13
  has_many :posts
  has_many :comments
  has_many :likes

  validates :Name, presence: true
  validates :PostsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).last(3)
  end
end

