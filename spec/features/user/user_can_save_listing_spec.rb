require 'rails_helper'

feature "User can save ski house listing" do
  before do
    setup_for_omniauth
    visit root_path
    click_link "Login with Facebook"
  end
  
  scenario "user selects a listing to save to their account after doing a search" do
    VCR.use_cassette("#craigslist_search_ski_houses") do
      visit root_path
      
      click_link "Search Ski Houses"
      fill_in "max_price", with: "2000"
      fill_in "location",  with: "Frisco"
      click_button "Find"
      
      # within("#listings .save-listing") do
      #   # first(:button, "Save").click
      #   click_button "Save"
      #   # expect{UserListing.count}.to change.by(1)
      #   expect(page).to have_content("Saved")
      # end
    end
  end
end
