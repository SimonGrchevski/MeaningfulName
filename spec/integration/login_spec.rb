require 'rails_helper'
RSpec.describe 'Sign in page', type: :system do
  before :all do
    User.create(name: 'Gandalf', email: 'gandalf@gmail.com', password: 'Mordor')
  end
  describe 'index page' do
    before(:each) do
      visit unauthenticated_root_path
    end
    it 'shows the page title' do
      expect(page).to have_content('Log in')
    end

    it 'shows the email field' do
      expect(page).to have_field('user_email')
    end

    it 'shows password field' do
      expect(page).to have_field('user_password')
    end

    it 'shows submit button' do
      expect(page).to have_selector(:link_or_button, 'Log in')
    end

    it 'Empty fields click' do
      find(:link_or_button, 'Log in').click
      expect(page).to have_content('Invalid Email or password')
    end

    it 'Fill the fields with fake data' do
      fill_in 'user_email', with: 'fakeemail@gmail.com'
      fill_in 'user_password', with: 'fakepassword'
      find(:link_or_button, 'Log in').click
      expect(page).to have_content('Invalid Email or password')
    end

    it 'Generate' do
      fill_in 'user_email', with: 'gandalf@gmail.com'
      fill_in 'user_password', with: 'Mordor'
      find(:link_or_button, 'Log in').click
      expect(page).to have_content('Gandalf')
    end
  end
end
