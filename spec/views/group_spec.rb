require 'capybara/rspec'
require 'rails_helper'

describe 'Groups', type: :feature do
  before :each do
    user = User.new(name: 'SpaYco')
    user.save
    visit '/signin'
    within('form') do
      fill_in 'id', with: 1
    end
    click_button 'Login'
  end

  it 'creates a group' do
    visit '/groups/new'
    within('form') do
        fill_in 'group[name]', with: 'first'
        fill_in 'group[icon]', with: 'https://i.imgur.com/CUG0Aof.jpg'
    end
    click_button 'Submit'
    expect(page).to have_content 'first'
  end
end
