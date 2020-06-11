require 'capybara/rspec'
require 'rails_helper'

describe 'Users', type: :feature do
  before :each do
    user = User.new(name: 'SpaYco')
    user.save
  end

  it 'creates a user' do
    visit '/users/new'
    within('form') do 
        fill_in 'user[name]', with: "SpaYso"
    end
    click_button 'Submit'
    visit '/signin'
    within('form') do
      fill_in 'id', with: 1
    end
    click_button 'Login'
    expect(page).to have_content 'SpaYso'
  end
end
