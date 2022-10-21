class Post < ApplicationRecord
  belongs_to :user
  has_many :Comments
  has_many :likes_counter

  after_save :updates_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def updates_posts_counter
    user.increment!(:PostsCounter)
  end

  def recent_comments
    comments.order(created_at: :desc).last(5)
  end

  def self .recent(max = 5)
    limit(max).order(created_at: :desc)
  end
end
