require 'rails_helper'

RSpec.describe 'Post view', type: :feature do
  include Devise::Test::IntegrationHelpers
  describe 'Post index' do
    let(:user) { User.create(name: 'Gandalf', email: 'gandalf@example.com', password: 'Flyyoufools', postcounter: 3) }

    describe 'display post information' do
      before do
        Post.create(title: 'The great decieve', text: 'My first post', user_id: user.id, commentscounter: 0,
                    likescounter: 0)
        Post.create(title: 'Black magic', text: 'My second post', user_id: user.id, commentscounter: 0, likescounter: 0)
        Post.create(title: 'Introduction to wild magic', text: 'My third post', user_id: user.id, commentscounter: 0,
                    likescounter: 0)
        sign_in user
        visit posts_path
      end

      it 'displays the author`s username.' do
        expect(page).to have_content('Gandalf')
      end

      it 'displays the number of posts the user has written.' do
        expect(page).to have_content('Number of posts:3')
      end

      it "displays the post's title." do
        expect(page).to have_content('The great decieve')
      end

      it "displays some of the post's body." do
        expect(page).to have_content('My second post')
      end
    end

    describe 'On posts with comments' do
      let(:post) do
        Post.create(title: 'Introduction to wild magic', text: 'My third post', user_id: user.id, commentscounter: 0,
                    likescounter: 0)
      end
      before do
        Comment.create(text: 'two', user_id: user.id, post_id: post.id)
        Comment.create(text: 'three', user_id: user.id, post_id: post.id)
        Comment.create(text: 'four', user_id: user.id, post_id: post.id)
        Comment.create(text: 'five', user_id: user.id, post_id: post.id)
        Like.create(post_id: post.id, user_id: user.id)

        sign_in user
        visit posts_path(user)
      end

      it 'display the first three comments on the post.' do
        expect(page).not_to have_content('I LOVE SARUMAN')
        expect(page).to have_content('two')
        expect(page).to have_content('three')
      end

      it 'display how many comments a post has.' do
        expect(page).to have_content("Comments: #{post.comments.count}")
      end

      it 'display how many likes a post has.' do
        expect(page).to have_content("Likes: #{post.likes.count}")
      end

      it "should redirected to that user's show page, when click on a user" do
        find(:link_or_button, user.name.to_s).click
        expect(current_path).to eq(post_path(post.id))
      end
    end
  end
end
