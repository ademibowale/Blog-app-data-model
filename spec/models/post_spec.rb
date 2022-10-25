require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(
      Name: 'Afolabi',
      Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      Bio: 'I am a graphic designer',
      PostsCounter: 0
    )
    @post = Post.create(
      title: 'Harry Potter',
      text: 'the sorcerers stone',
      user_id: @user.id,
      comments_counter: 0,
      likes_counter: 0
    )
  end

  it 'post should return valid as created' do
    expect(@post).to be_valid
  end

  it 'post title should be present' do
    expect(@post.title).to be_present
  end

  it 'post text should not be too short' do
    @post.text = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula
        eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient
        montes'
    expect(@post).to be_valid
  end

  it 'post comments_counter should be numeric' do
    @post.comments_counter = 'one'
    expect(@post).to_not be_valid
  end

  it 'post likes_comment should be numeric >= 0' do
    @post.likes_counter = 'one'
    expect(@post).to_not be_valid
  end
end
