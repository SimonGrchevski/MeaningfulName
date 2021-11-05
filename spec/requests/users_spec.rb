# require 'rails_helper'
# RSpec.describe 'Users', type: :request do
  
#   # index
#   describe 'GET #index' do
#     before(:example) { get users_path }
#     it 'is a success' do
#       expect(response).to have_http_status(:ok)
#     end
#     it "renders 'index' template" do
#       expect(response).to render_template('index')
#     end

#     it 'renders title' do
#       expect(response.body).to include('Users')
#     end
#   end

#   # show
#   describe 'GET #show' do
#     before :each do 
#       User.create(name: "Simon")
#     end

#     before(:example) { get show_url}
#     it 'is a success' do
#       expect(response).to have_http_status(:ok)
#     end

#     it "renders 'show' template" do
#       expect(response).to render_template('show')
#     end

#   end
# end
