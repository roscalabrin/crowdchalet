require 'rails_helper'

feature "User can search for ski houses to rent" do
  before do
    setup_for_omniauth
    visit root_path
    click_link "Login with Facebook"
  end
  scenario "user enter valid search parameters and sees a list of house listings" do
    VCR.use_cassette("#craigslist_search_ski_houses") do
      visit root_path
      
      click_link "Search Ski Houses"
      fill_in "max_price", with: "2000"
      fill_in "location",  with: "Frisco"
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