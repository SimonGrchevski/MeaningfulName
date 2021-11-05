require 'rails_helper'

RSpec.describe Post, type: :model do
  before :all do
    @user = User.create(name: 'Simon', postcounter: 30)
  end

  subject { Post.create(text: 'My post', user_id: 1, commentsCounter: 0, likesCounter: 0) }

  describe 'Validations' do
    it 'returns true if post was created successfully' do
      expect(subject).to be_truthy
    end

    it 'text should be valid' do
      subject.text = ''
      expect(subject).to_not be_valid
    end

    it 'text should be valid length' do
      subject.text = 'abc' * 200
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
      subject.commentsCounter = -3
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:likes) }
    it { should have_many(:comments) }
    it { should belong_to(:user) }
  end

  describe 'methods' do
    it 'update_post_counter' do
      @changed = Post.update_post_counter(user: 'Simon', update_to: 13)
      expect(@changed).to be_truthy
    end
  end
end
