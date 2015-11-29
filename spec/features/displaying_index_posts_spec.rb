require 'rails_helper'

feature 'Index displays a list of posts' do
  background do
    user = create :user
    post_one = create(:post, caption: 'This is post one')
    post_two = create(:post, caption: 'This is the second post')

    sign_in_with user
  end

  scenario 'the index displays correct created job information' do
    visit '/'
    expect(page).to have_content('This is post one')
    expect(page).to have_content('This is the second post')
    expect(page).to have_css("img[src*='coffee']")
  end
end
