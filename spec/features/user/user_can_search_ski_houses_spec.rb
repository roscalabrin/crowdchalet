require 'rails_helper'

RSpec.feature "User can search for ski houses to rent" do
  scenario "user enter valid search parameters and sees a list of house listings" do
    # VCR.use_cassette("") do
      visit root_path
      
      click_link "Search Ski Houses"
      fill_in "max_price", with: "2000"
      fill_in "location",  with: "Frisco"
      click_button "Search"
      
      within(".search-results") do
        expect(page).to have_content "Search Results"
      end
      
      within(".search-results") do
        expect(page).to have_content "Frisco ...."
      end
    # end
  end
end