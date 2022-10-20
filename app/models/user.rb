class User < ApplicationRecord
  has_many :posts, foreign_key: :poster_id
  has_many :comments, foreign_key: :commentee_id
  has_many :likes, foreign_key: :likee_id

  def recent_posts
    posts.order(created_at: :desc).last(3)
  end

  def self .recent(max = 3)
    limit(max).order(created_at: :desc)
  end
end
