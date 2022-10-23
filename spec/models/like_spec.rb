require 'rails_helper'

RSpec.describe Like, type: :model do
  @user = User.create(
    Name: 'Doe', Photo: 'https://johndoe.com/me.png',
    Bio: 'I am John Doe.', PostsCounter: 0
  )
  post = Post.create(
    user: @user, title: 'About', text: 'About me', comments_counter: 0,
    likes_counter: 0
  )
  Like.create(post:, user: @user)
  context 'update_likes_counter' do
    it ' increment likes_counter' do
      expect(Post.find(post.id).likes_counter).eql?(post.likes_counter + 1)
    end
  end
end