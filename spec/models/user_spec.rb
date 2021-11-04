require '../rails_helper'
require '../spec_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:likes) }
    it { should have_many(:posts) }
    it { should have_many(:comments) }

    it 'returns true if user was created correctly' do
      user = User.create(name: 'Gandalf',postcounter:0)
      expect(user).to be_truthy
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:postcounter) }
    it { should validate_type_of(:postcounter) }
    it { should validate_length_of(:name) }
  end
end 