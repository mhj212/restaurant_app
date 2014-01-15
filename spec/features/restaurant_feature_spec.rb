require 'spec_helper'

  describe "restaurants" do
    describe "When I do a search for a restaurant" do
       before do
       	visit restaurant_search_path
     @restaurant_name = "Hearth"
        end

    	it "should bring you to the search results page" do
       current_path.should == restaurant_search_path

       end

        it "should display the restaurant name" do
        # find(:css, "ul").text.should have_content(@boy_name)
        page.should have_content(@restaurant_name)
      end
    end
  end


