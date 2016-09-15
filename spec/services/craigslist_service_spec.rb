require 'rails_helper'

describe CraigslistService do
  context "#search_ski_houses" do
    it "finds ski housed based on user's search parameters" do
      VCR.use_cassette("craigslist_search_ski_houses") do
        search_result = CraigslistService.new.search_ski_houses(location: "Frisco", max_price: "2000")
        listing =  search_result.first
  
        expect(search_result.count).to eq(24)
        expect(listing.attributes).to have_key("href")
        expect(listing.children.text.class).to eq String
      end
    end    
  end
end
