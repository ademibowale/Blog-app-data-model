require 'rails_helper'

RSpec.describe Comment, type: :model do
  @user = User.create(
    Name: 'Doe', Photo: 'https://johndoe.com/me.png',
    Bio: 'I am John Doe.', PostsCounter: 0
  )
  post = Post.create(
    user: @user, title: 'About', text: 'About me', comments_counter: 0,
    likes_counter: 0
  )
  Comment.create(post:, user: @user)
  context 'update_comments_counter' do
    it ' increment comments_counter' do
      expect(Post.find(post.id).comments_counter).eql?(post.comments_counter + 1)
    end
  end
end
