require 'rails_helper'

feature 'Deleting comments' do
  scenario 'user can delete their own comments' do
    #user = create :user
    #user_two = create(:user, id: 2,
                             #email: 'bar@foo.com',
                             #user_name: 'barfoo')
    #post = create :post
    #comment = create(:comment, user_id: user_two.id,
                             #post_id: post.id)
    #sign_in_with user_two
    #save_and_open_page
  #end

    user = create :user
    post = create(:post, user_id: user.id)
    sign_in_with user

    visit '/'
    fill_in "comment_content_#{post.id}", with: ';P'
    click_button 'Submit'
    expect(page).to have_content(';P')
    expect(page).to have_content('Nice comment!')
    click_link 'delete-1' # Dynamically add the id in your view
    expect(page).not_to have_content('Nice comment!')
  end
end
