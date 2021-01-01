require 'capybara/rspec'
require 'rails_helper'

describe 'Sessions', type: :feature do
  before :each do
    User.create(name: 'SpaYco')
  end

  it 'logs me in' do
    visit '/signin'
    within('form') do
      fill_in 'id', with: 1
    end
    click_button 'Login'
    expect(page).to have_content 'SpaYco'
  end
  it 'logs me out' do
    visit '/signin'
    within('form') do
      fill_in 'id', with: 1
    end
    click_button 'Login'
    visit '/signout'
    expect(page).to have_content 'New User'
  end
end
