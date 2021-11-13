require 'rails_helper'

RSpec.describe 'Post view', type: :feature do
  include Devise::Test::IntegrationHelpers
  describe 'Post show' do
    let(:user) { User.create(name: 'Gandalf', email: 'gandalf@example.com', password: 'Flyyoufools',postcounter:3) }
    let(:user_two) { User.create(name: 'Frodo', email: 'frody@example.com', password: 'runforest') }
    let(:comment) { Comment.create(text: 'two', user_id: user.id, post_id: post.id) }

    describe 'display post information' do
      let(:post) { Post.create(title: 'The great decieve', text: 'My first post', user_id: user.id,commentscounter:0, likescounter:0) }
      before do
        Comment.create(text: 'Its gandy here', user_id: user.id, post_id: post.id)
        Comment.create(text: 'Its frody', user_id: user_two.id, post_id: post.id)

        Like.create(post_id: post.id, user_id: user.id)

        sign_in user
        visit posts_path(post)
      end

      it "displays the post's title." do
        expect(page).to have_content('The great decieve')
      end

      it 'displays who wrote the post.' do
        expect(page).to have_content(post.user.name)
      end

      it 'display how many comments the post has.' do
        expect(page).to have_content("Comments: #{post.comments.count}")
      end

      it 'display how many likes the post has.' do
        expect(page).to have_content("Likes: #{post.likes.count}")
      end

      it 'display post`s body.' do
        expect(page).to have_content('My first post')
      end

      it 'display the username of each commentor.' do
        expect(page).to have_content(comment.user.name)
      end

      it 'display the comment each commentor left.' do
        expect(page).to have_content('Its gandy here')
        expect(page).to have_content('Its frody')
      end
    end
  end
end