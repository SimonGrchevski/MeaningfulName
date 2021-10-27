require 'rails_helper'
RSpec.describe 'Users', type: :request do
  # index
  describe 'GET #index' do
    before(:example) { get users_path }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'renders title' do
      expect(response.body).to include('Users INDEX')
    end
    it 'renders title' do
      expect(response.body).to have_tag('h2')
    end
  end

  # show
  describe 'GET #show' do
    before(:example) { get '/users/:show' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'renders title' do
      expect(response.body).to have_tag('h3')
    end
  end
end
