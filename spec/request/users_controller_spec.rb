require 'rails_helper'
RSpec.describe 'Users', type: :request do
  describe 'Get and checks User ' do
    before(:example) do
      get '/users'
    end

    it 'Checks if the status response is succes(OK)' do
      expect(response.status).to be(200)
    end

    it 'Checks if it render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'Check the placeholder text' do
      expect(response.body).to include('<h1>My Favourite blog App</h1>')
    end
  end

  describe 'Check specific user' do
    before(:example) do
      get '/users/1'
    end

    it 'Checks if the status response is succes(OK)' do
      expect(response.status).to be(200)
    end

    it 'Checks if it render the correct template' do
      expect(response).to render_template(:show)
    end

    it 'Check if it has the correct placeholder text' do
      expect(response.body).to include('<h1>Hello, My name is ADEBOWALE. I\'m railing</h1>')
    end
  end
end
