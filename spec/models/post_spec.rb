require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(text:'My post', user_id:1) }

  describe 'Validations' do

    it 'returns true if post was created successfully' do
      expect(subject).to be_truthy
    end

    it 'text should be valid' do
      subject.text = ''
      expect(subject).to_not be_valid
    end

    it 'text should be valid length' do
      subject.text = 'abc'*200
      expect(subject).to_not be_valid
    end

    it 'comments counter should be numberic value' do
      subject.commentsCounter = 'a'
      expect(subject).to_not be_valid
    end

    it 'comments counter should be greater or equal to 0' do
      subject.commentsCounter = -3
      expect(subject).to_not be_valid
    end

    it 'likes counter should be numberic value' do
      subject.likesCounter = 'a'
      expect(subject).to_not be_valid
    end

    it 'likes counter should be greater or equal to 0' do
      subject.likesCounter = -3
      expect(subject).to_not be_valid
    end

    # it 'postcounter should be valid' do
    #   subject.postcounter = nil
    #   expect(subject).to_not be_valid
    # end

    # it 'postcounter should greater or eq to 0' do
    #   subject.postcounter = -3
    #   expect(subject).to_not be_valid
    # end

    # it 'name should be at least 5 characters' do
    #   subject.name = 'abc'
    #   expect(subject).to_not be_valid
    # end

    # it 'name should be maximum 25 characters' do
    #   subject.name = 'a'*26
    #   expect(subject).to_not be_valid
    # end
  end

  describe 'associations' do
    it { should have_many(:likes) }
    it { should have_many(:comments) }
    it { should belong_to(:user) }
  end
end
