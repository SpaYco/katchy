require 'capybara/rspec'
require 'rails_helper'

describe 'Groups', type: :feature do
  before :each do
    User.create(name: 'SpaYco')
    Group.create(name: 'morning session', icon: 'https://i.imgur.com/CUG0Aof.jpg')
    User.first.recipes.create(name: 'space',ingredients: 'azdasd asd azed azdazd', video: "https://youtu.be/p1NURlot8Lo", amount: 45, group_id: 1)
  end
  it 'creates a recipe' do
    expect(Recipe.first.name).to eql('space')
  end
  it 'have a relation with User table' do
    expect(User.first.recipes.first.name).to eql('space')
  end
  it 'have a relation with Group table' do
    expect(Group.first.recipes.first.name).to eql('space')
  end
end
