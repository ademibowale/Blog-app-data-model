require 'rails_helper'

RSpec.describe 'post', type: :system do
  describe 'post index page' do
    before :all do
      @user = User.create(name: 'Doe', photo: 'https://somewebsite.com',
                          bio: 'I am a software developer', posts_counter: 0)
      @post = Post.create(title: 'About', text: 'This is a post', author: @user, comments_counter: 0, likes_counter: 0)
    end

    it 'I can see the user\'s name' do
      visit user_posts_path(@user)
      expect(page).to have_content('Adebowale')
    end
    it 'display profile picture' do
      visit user_posts_path(@user)
      expect(page).to have_css("img[src='https://somewebsite.com']")
    end
    it 'display the number of posts' do
      visit user_posts_path(@user)
      expect(page).to have_content('posts: 1')
    end
    it 'display the post title' do
      visit user_posts_path(@user)
      expect(page).to have_content('About')
    end
    it 'display post text' do
      visit user_posts_path(@user)
      expect(page).to have_content('This is a post')
    end
    it 'I can see see some comments' do
      visit user_posts_path(@user)
      expect(page).to have_content('Comments')
    end

    it 'I can see how many comments the post has' do
      visit user_posts_path(@user)
      expect(page).to have_content('Comments 0')
    end

    it 'I can see section of pagination if there' do
      visit user_posts_path(@user)
      expect(page).not_to have_content('Pagination')
    end

    it 'When I click a post it redirects me to the post show page' do
      visit user_posts_path(@user)
      click_link('About')
      expect(page).to have_current_path(user_post_path(@user, @post))
    end
  end
end
