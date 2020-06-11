require 'capybara/rspec'
require 'rails_helper'

describe 'Users', type: :feature do
  before :each do
    user = User.new(name: 'SpaYco')
    user.save
    visit '/signin'
    within('form') do
      fill_in 'id', with: 1
    end
    click_button 'Login'
    visit '/groups/new'
    within('form') do
      fill_in 'group[name]', with: 'first'
      fill_in 'group[icon]', with: 'https://i.imgur.com/CUG0Aof.jpg'
    end
    click_button 'Submit'
  end
  it 'creates a recipe' do
    visit '/recipes/new'
    within('form') do
      fill_in 'recipe[name]', with: 'pizza'
      select 'first', from: 'recipe[group_id]'
      fill_in 'recipe[ingredients]', with: 'first\nsecond\nthird'
      fill_in 'recipe[video]', with: 'https://youtu.be/p1NURlot8Lo'
      fill_in 'recipe[amount]', with: 45
    end
    click_button 'Submit'
    expect(page).to have_content 'pizza'
  end
end
