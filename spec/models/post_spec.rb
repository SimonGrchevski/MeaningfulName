require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(name:'My post', postcounter:0) }
end
