require 'rails_helper'

RSpec.describe 'User view', type: :feature do
  include Devise::Test::IntegrationHelpers
  describe 'User show page' do
    let(:user) { User.create(name: 'Gandalf', email: 'gandalf@example.com', password: 'Flyyoufools') }

    before do
      @user_one = User.create(name: 'Frodo', email: 'frody@example.com', password: 'runforest', bio:'Its me,Frodo',postcounter:3)
      @user_two = User.create(name: 'Sam', email: 'sam@example.com', password: 'Iobaymaster')

      sign_in user
      visit user_path(@user_one)
    end

    it "should be able to see user's name" do
      expect(page).to have_content('Frodo')
    end

    it 'should be able see the number of posts the user has written.' do
      expect(page).to have_content('Number of posts:3')
    end

    it "should be able see the user's bio." do
      expect(page).to have_content('Its me,Frodo')
    end

    it "should see a button that lets me view all of a user's posts." do
      expect(page).to have_content('Show all posts')
    end

    it "should redirects me to the user's post's index page, when click on a see all posts button" do
      find_link("Show all posts").click
      expect(current_path).to eq(posts_path)
    end
  end
end