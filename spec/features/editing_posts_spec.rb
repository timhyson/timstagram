require 'rails_helper'

feature 'Editing Posts' do
  background do
    user = create :user
    post = create(:post, user_id: user.id)

    sign_in_with (user)
    visit '/'
  end

  scenario 'Can edit a post' do
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page).to have_content('Edit Post')

    click_link 'Edit Post'
    fill_in 'Caption', with: "Oh dear, you weren't meant to see this picture!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated hombre")
    expect(page).to have_content("Oh dear, you weren't meant to see this picture!")
  end

  scenario "Won't update a post without an image" do
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
    attach_file('Image', 'spec/files/coffee.jpg.zip')
    click_button 'Update Post'

    expect(page).to have_content("Something is wrong with your form!")
  end
end
