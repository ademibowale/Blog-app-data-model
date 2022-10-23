require 'rails_helper'
RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(
      name: 'Doe', photo: 'https://johndoe.com/me.png',
      bio: 'I am John Doe.', posts_counter: 0
    )
  end
  subject do
    Post.new(
      user: @user, title: 'About', text: 'About me', comments_counter: 1,
      likes_counter: 0
    )
  end
  before { subject.save }
  context 'Return valid data' do
    it 'should accept comments_counter' do
      subject.comments_counter = 2
      expect(subject).to be_valid
    end
    it 'should accept title' do
      subject.title = 'About'
      expect(subject).to be_valid
    end
    it 'should accept likes_counter' do
      subject.likes_counter = 6
      expect(subject).to be_valid
    end
  end
  context 'Return invalid data' do
    it 'should not accept more than 250 character' do
      subject.title = '
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula
        eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient
        montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque
        eu, pretium quis,'
      expect(subject).to_not be_valid
    end
    it 'should not accept blank title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it 'should accept negative comments_counter' do
      subject.comments_counter = -2
      expect(subject).to_not be_valid
    end
    it 'should accept negative likes_counter' do
      subject.likes_counter = -6
      expect(subject).to_not be_valid
    end
    it 'should accept non numerical comments_counter' do
      subject.comments_counter = 'C'
      expect(subject).to_not be_valid
    end
    it 'should accept non numerical likes_counter' do
      subject.likes_counter = 'C'
      expect(subject).to_not be_valid
    end
  end
end






# require 'rails_helper'
# require 'ffi'

# RSpec.describe Post, type: :model do
#   before(:all) do
#     @user = User.create(
#       Name: 'Akorede',
#       Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
#       Bio: 'Am a software developer',
#       PostsCounter: 2
#     )
#     @post = Post.create(
#       title: 'Harry Potter',
#       text: 'the sorcerers stone',
#       user: @user
#     )
#   end

#   it 'post should return valid as created' do
#     expect(@post).to_not be_valid
#   end

#   it 'post title should be present' do
#     @post.title = 'nil'
#     expect(@post).to_not be_valid
#   end

#   it 'post text should not be too short' do
#     @post.text = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula
#         eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient
#         montes'
#     expect(@post).to_not be_valid
#   end

#   it 'post comments_counter should be numeric' do
#     @post.comments_counter = 'one'
#     expect(@post).to_not be_valid
#   end

#   it 'post likes_comment should be numeric >= 0' do
#     @post.likes_counter = 'one'
#     expect(@post).to_not be_valid
#   end
# end