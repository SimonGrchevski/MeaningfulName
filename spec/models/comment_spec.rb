require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(user_id: 1, post_id: 1) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
