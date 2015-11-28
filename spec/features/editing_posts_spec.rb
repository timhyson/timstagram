require 'rails_helper'

feature 'Editing Posts' do
  background do
    job = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'Can edit a post' do
    fill_in 'Caption', with: "Oh dear, you weren't meant to see this picture!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated hombre")
    expect(page).to have_content("Oh dear, you weren't meant to see this picture!")
  end

  it "Won't update a post without an image" do
    attach_file('Image', 'spec/files/coffee.jpg.zip')
    click_button 'Update Post'

    expect(page).to have_content("Something is wrong with your form!")
  end
end
