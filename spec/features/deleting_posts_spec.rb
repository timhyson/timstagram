require 'rails_helper'

feature 'Deleting posts' do
  background do
    user = create :user
    post = create(:post, caption: 'drunken selfie', user_id: user.id)

    sign_in_with user
  end

  scenario 'Can delete a single post' do
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'

    click_link 'Delete Post'

    expect(page).to have_content('Problem solved! Post deleted.')
    expect(page).not_to have_content('drunken selfie')
  end
end
