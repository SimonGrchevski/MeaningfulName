require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(user_id:1, post_id:1) }
  
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
