class User < ApplicationRecord
  has_many :posts, foreign_key: :post_id
  has_many :comments, foreign_key: :comment_id
  has_many :likes, foreign_key: :like_id

  validates :Name, presence: true
  validates :PostsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).last(3)
  end
end
