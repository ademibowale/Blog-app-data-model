require 'rails_helper'

RSpec.describe User, type: :feature do
  describe 'Index page' do
    before(:all) do
      visit users_path
      @users = User.all
    end

    it 'should see the username of other users' do
      @users.each do |user|
        expect(page).to have_content(user.Name)
      end
    end

    it 'should see the profile picture of each user' do
      @users.each do |user|
        expect(page).to have_css("img[src*='#{user.Photo}']")
      end
    end

    it 'should see the numer of posts for each user' do
      @users.each do |user|
        expect(page).to have_content(user.PostsCounter)
      end
    end

    it 'should redirect to user\'s show page' do
      @users.each do |user|
        find_link(user.Name).click
        expect(page).to have_current_path(user_path(user))
      end
    end
  end

  describe 'Show page' do
    before(:each) do
      @user = User.create(
        Name: 'Tom',
        Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        Bio: 'Teacher from Mexico.',
        PostsCounter: 0
      )
      Post.create(
        id: rand(1000),
        user: @user,
        title: 'My testing',
        text: 'This is my testing post',
        comments_counter: 0,
        likes_counter: 0
      )
      @user = User.all
      visit user_path(@user.first)
    end

    it 'should show user\'s picture' do
      expect(page).to have_css("img[src*='#{@user.first.Photo}']")
    end

    it 'should show user\'s name' do
      expect(page).to have_content(@user.first.Name)
    end

    it 'should show number of posts user wrote' do
      expect(page).to have_content(@user.first.PostsCounter)
    end

    it 'should show user\'s bio' do
      expect(page).to have_content(@user.first.Bio)
    end

    it 'should show a button to view all user\'s posts' do
      expect(page).to have_link('See all posts')
    end

    it 'should redirect to user\'s posts page' do
      find_link('See all posts').click
      expect(page).to have_current_path(user_posts_path(@user.first))
    end

    it 'should have a button to let me view all user\'s post' do
      expect(page).to have_link('See all posts')
    end
  end
end
