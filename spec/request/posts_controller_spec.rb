require 'rails_helper'

describe PostsController, type: :request do
  describe "GET '/index' page" do
    before(:all) do
      @link = get '/users/:id/posts'
      get '/users/:id/posts'
    end

    it 'returns a 200 status code' do
      expect(@link).to eq(200)
    end

    it 'renders the index template' do
      expect(get('/users/:id/posts')).to render_template('posts/index')
    end

    it 'loads the posts to includes correct placeholder text' do
      expect(response.body).to include('<h2>The User Post</h2>')
    end
  end

  describe "GET '/show' page" do
    before(:all) do
      @link = get '/users/:id/posts/:id'
      get '/users/:id/posts/:id'
    end

    it 'returns a 200 status code' do
      expect(@link).to eq(200)
    end

    it 'renders the show template' do
      expect(get('/users/:id/posts/:id')).to render_template('posts/show')
    end

    it 'loads the posts to includes correct placeholder text' do
      expect(response.body).to include('<h1>This is my todo list</h1>')
    end
  end
end
