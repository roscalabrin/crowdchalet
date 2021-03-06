require 'rails_helper'

feature "User can search for ski houses to rent" do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  scenario "user enter valid search parameters and sees a list of house listings" do
    VCR.use_cassette("#craigslist_search_ski_houses") do
      visit root_path
      
      click_link "Search Ski Houses"
      fill_in "location",  with: "Frisco"
      fill_in "max_price", with: "2000"
      click_button "Find"
      
      within(".search-results") do
        expect(page).to have_content "Search Results"
        expect(page).to have_content "24 listings found"
        expect(page).to have_content "1 bedroom in Frisco near Lake"
        expect(page).to have_link "https://rockies.craigslist.org/apa/5780462736.html"
      end
    end
  end
end