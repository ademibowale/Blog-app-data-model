require 'rails_helper'

RSpec.describe 'post', type: :system do
  describe 'post show page' do
    before :all do
      @user = User.create(name: 'Doe', photo: 'https://somewebsite.com',
                          bio: 'I am a software developer', posts_counter: 1)
      @post = Post.create(title: 'About', text: 'This is a post', author: @user, comments_counter: 0,
                          likes_counter: 0)
    end

    it 'display title' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('About')
    end
    it 'Display author of the post' do
      visit user_post_path(@user, @post)
      expect(page).not_to have_content('winter is comming')
    end

    it 'Display number of comments the post has' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Comments 0')
    end

    it 'Display number of likes the post has' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Likes 0')
    end

    it 'Display the posts text' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('This is a post')
    end

    it 'display the posts comments' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Comments')
    end
  end
end
