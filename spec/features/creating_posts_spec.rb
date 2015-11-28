require 'rails_helper.rb'

feature 'Creating posts' do
  background do
    visit '/'
    click_link 'New Post'
  end
  scenario 'can create a post' do
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_button 'Create Post'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

  it 'needs an image to create a post' do
    fill_in 'Caption', with: 'No picture because YOLO'
    click_button 'Create Post'
    expect(page).to have_content ('Halt, you fiend! You need an image to post here!')
  end
end
