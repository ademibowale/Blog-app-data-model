require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'Check post main page' do
    before(:example) do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    it 'Checks if the status response is succes(OK)' do
      expect(response.status).to be(200)
    end

    it 'Check the if the rendered template is correct' do
      expect(response.body).to include('<h1>Here is a list of posts for a given user</h1>')
    end
  end

  describe 'Check posts for specific user' do
    before(:example) do
      get '/users/1/posts/:id'
      expect(response).to render_template(:show)
    end

    it 'Check the posts page for a given user' do
      expect(response).to render_template(:show)
      expect(response.body).to include('<h1>This is my todo list</h1>')
      expect(response.status).to be(200)
    end
  end
end
