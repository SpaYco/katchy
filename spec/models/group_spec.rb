require 'capybara/rspec'
require 'rails_helper'

describe 'Groups', type: :feature do
  before :each do
    User.create(name: 'SpaYco')
    Group.create(name: 'morning', icon: 'https://i.picsum.photos/id/498/200/300.jpg')
  end
  it 'creates a group' do
    expect(Group.first.name).to eql('morning')
  end
end
