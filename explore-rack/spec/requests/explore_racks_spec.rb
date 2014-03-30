require 'spec_helper'

describe "ExploreRacks" do

   before do
        @product = Product.create :name => 'Nexus 5', :price => 30000
   end
       after  do
        Product.delete_all 
       end

  describe "GET /products" do
    it "display some products list" do
        visit products_path
        page.should have_content "Nexus 5"
    end

    it "add a product into product catalog" do
    	visit products_path
    	click_button 'New Product'
    	current_path.should == new_product_path
    	fill_in :Name, :with =>  'Nexus 5'
    	fill_in :Price, :with => '30000'
    	click_button 'Save Product'
    	#current_path.should == products_path
    	
    end

    it "show details of a product" do
        visit product_path(@product)
        page.should have_content 'Nexus 5'
        page.should have_content '30000'    
    end

    it "edit a Product details" do
        visit products_path
        find("#product_#{@product.id}").click_link 'Edit'
        current_path.should == edit_product_path(@product)
        find_field('Name').value.should eq 'Nexus 5'
        find_field('Price').value.should eq '30000'
        fill_in 'Price', :with => '25000'
        click_button 'Save Product'
        page.should have_content '25000'
        visit products_path
        page.should have_no_content '30000'
        
    end 

    it "delete a product" do
        visit products_path
        find("#product_#{@product.id}").click_link 'Delete'
        page.should have_no_content 'Nexus 5'
        page.should have_no_content 'Nexus 5'
        current_path.should == products_path
    end
   end
end
