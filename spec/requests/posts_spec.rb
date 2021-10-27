require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'Get index' do
    before(:example) { get posts_path }
    it 'It is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'Renders index template' do
      expect(response).to render_template('index')
    end

    it 'Renders title' do
      expect(response.body).to include('POSTS INDEX')
    end

    it 'Renders tag' do
      expect(response.body).to have_tag('h1')
    end
  end

  describe 'Get show' do
    before(:example) { get '/posts/:show' }
    it 'It is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'Renders show template' do
      expect(response).to render_template('show')
    end
    it 'Renders title' do
      expect(response.body).to include(' POSTS SHOW ')
    end
    it 'Renders tag' do
      expect(response.body).to have_tag('p')
    end
  end
end
