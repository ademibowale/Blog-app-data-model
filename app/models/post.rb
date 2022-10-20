class Post < ApplicationRecord
   belongs_to :user
   has_many :Comments       
   has_many :likes_counter

   after_save :updates_posts_counter

  def updates_posts_counter
    user.increment!(:PostsCounter)
  end

  def recent_comments
    comments.order(created_at: :desc).last(5)
  end
end
