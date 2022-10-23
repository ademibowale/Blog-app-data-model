require 'rails_helper'
RSpec.describe Like, type: :model do
  @user = User.create(
    name: 'Doe', photo: 'https://johndoe.com/me.png',
    bio: 'I am John Doe.', posts_counter: 0
  )
  post = Post.create(
    author: @user, title: 'About', text: 'About me', comments_counter: 0,
    likes_counter: 0
  )
  Like.create(post:, author: @user)
  context 'update_likes_counter' do
    it ' increment likes_counter' do
      expect(Post.find(post.id).likes_counter).eql?(post.likes_counter + 1)
    end
  end
end


# require 'rails_helper'

# RSpec.describe Like, type: :model do
#   before(:all) do
#     @user = User.create(
#       Name: 'Afolabi',
#       Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
#       Bio: 'I am a graphic designer',
#       PostsCounter: 0
#     )
#     @post = Post.create(
#       title: 'Harry Potter',
#       text: 'the sorcerers stone',
#       author_id: @user.id,
#       comments_counter: 0,
#       likes_counter: 0
#     )
#   end

#   it 'like_counter should increase by one' do
#     Like.create(author_id: @user.id, post_id: @post.id)
#     post = Post.new(@post.id)
#     expect(post.likes_counter).to eq(nil)
#   end
# end
