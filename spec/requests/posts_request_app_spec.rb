require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before :example do
    @user = User.create(id: 10, name: 'Alfred', photo: 'https://somewebsite.com',
                        bio: 'I am a software developer', posts_counter: 0)
    @post = Post.create(id: 4, title: 'Post 1', text: 'This is a post', author: @user, comments_counter: 0,
                        likes_counter: 0)
  end

  it 'renders the posts index' do
    get user_posts_path(@user)
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
    expect(response.body).to include('All posts by user')
  end

  it 'renders the users show' do
    get user_post_path(@user, @post)
    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
    expect(response.body).to include('This is a post')
  end
end
