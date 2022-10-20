class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def recent_posts
    posts.order(created_at: :desc).last(3)
  end

  def self .recent(max = 3)
    limit(max).order(created_at: :desc)
  end
  end

