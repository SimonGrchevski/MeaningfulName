require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name:'Simon', postcounter:0) }
  
  describe 'Validations' do

    it 'returns true if user was created correctly' do
      expect(subject).to be_truthy
    end

    it 'name should be present' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'postcounter should be valid' do
      subject.postcounter = nil
      expect(subject).to_not be_valid
    end

    it 'postcounter should greater or eq to 0' do
      subject.postcounter = -3
      expect(subject).to_not be_valid
    end

    it 'name should be at least 5 characters' do
      subject.name = 'abc'
      expect(subject).to_not be_valid
    end

    it 'name should be maximum 25 characters' do
      subject.name = 'a'*26
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:likes) }
    it { should have_many(:posts) }
    it { should have_many(:comments) }
  end
end 