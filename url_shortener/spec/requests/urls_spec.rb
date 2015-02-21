require 'spec_helper'

describe 'Urls' do
  @url = Url.create :long_url => 'https://500px.com/photo/9916095'
end

# describe "Urls" do
# 	before do
#         @product = Product.create :name => 'Nexus 5', :price => 30000
#         @url = Url.create :long_url => 'https://500px.com/photo/9916095'
#    end
#   describe "GET /urls" do
#     it "dispaly all urls" do
      
      
#       visit urls_path
#       page.should have_content 'https://500px.com/photo/9916095'
#     end
#   end
# end
