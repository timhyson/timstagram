require 'rails_helper'

feature 'Deleting comments' do
  background do
    user = create :user
    user_two = create(:user, id: 2,
                             email: 'bar@foo.com',
                             user_name: 'barfoo')
    post = create :post
    comment = create(:comment, user_id: user_two.id,
                     post_id: post.id)
    comment_two = create(:comment, id: 2,
                                   post_id: post.id,
                                   content: 'You guys are too kind')
    sign_in_with user_two
  end

  scenario 'user can delete their own comments' do
    visit '/'

    expect(page).to have_content('Nice post!')
    click_link 'delete-1'
    expect(page).not_to have_content('Nice post!')
  end

  scenario 'user cannot delete a comment not belonging to them via the ui' do
    visit '/'

    expect(page).to have_content('You guys are too kind')
    expect(page).not_to have_css('#delete-2')
  end

  scenario 'user cannot delete a comment not belonging to them via urls' do
    visit '/'

    expect(page).to have_content('You guys are too kind')
    page.driver.submit :delete, "posts/1/comments/2", {}
    expect(page).to have_content("That post doesn't belong to you!")
    expect(page).to have_content('You guys are too kind')
  end
end
