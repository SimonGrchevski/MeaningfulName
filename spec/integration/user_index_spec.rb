require 'rails_helper'

RSpec.describe 'User view', type: :feature do
  include Devise::Test::IntegrationHelpers
  describe 'User index view' do
    let(:user) { User.create(name: 'Gandalf', email: 'gandalf@example.com', password: 'Flyyoufools', postcounter: 3) }

    before do
      @user_one = User.create(name: 'Frodo', email: 'frody@example.com', password: 'runforest')
      @user_two = User.create(name: 'Sam', email: 'sam@example.com', password: 'Iobaymaster')

      sign_in user
      visit users_path
    end

    it 'should be able see the username of all other users.' do
      expect(page).to have_content('Frodo')
      expect(page).to have_content('Sam')
    end

    it 'should be able see the number of posts each user has written.' do
      expect(page).to have_content('Number of posts 3')
    end

    it "should redirected to that user's show page, when click on a user" do
      find(:link_or_button, user.name.to_s).click
      expect(current_path).to eq(user_path(user.id))
    end
  end
end
