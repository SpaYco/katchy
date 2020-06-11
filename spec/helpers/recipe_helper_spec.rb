require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RecipeHelper. For example:
#
# describe RecipeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe RecipeHelper, type: :helper do
  it 'gets youtube id' do
    expect(helper.get_youtube_id("https://youtu.be/p1NURlot8Lo")).to eq('p1NURlot8Lo')
  end
end
