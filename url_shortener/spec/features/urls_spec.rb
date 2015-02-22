require 'spec_helper'


describe "Urls" do

  describe " /urls" do

    it "Short a long url" do
    	visit urls_path
    	fill_in 'url_long_url', :with => "https://500px.com/photo/9916095"
    	
        click_button 'shorten URL'
        current_path.should == root_path
        expect(page.text).to match(/http:\/\/127.0.0.1:80\/[a-zA-Z0-9]*/)
        save_and_open_page
    end

    it "dispaly long urls and corresponding short url" do
        visit urls_path
    	fill_in 'url_long_url', :with => "https://500px.com/photo/9916095"
    	
        click_button 'shorten URL'
        current_path.should == root_path
        expect(page).to have_content 'https://500px.com/photo/9916095'
        expect(page.text).to match(/http:\/\/127.0.0.1:80\/[a-zA-Z0-9]*/)
        save_and_open_page
    end

    it "should not create any shorten URL for any empty URL" do
        visit urls_path
        fill_in 'url_long_url', :with => ""
        click_button 'shorten URL'

        expect(current_path).to match(root_path)
        expect(page).to have_content 'There was an error in creating shorted url'
    end
  end
end
