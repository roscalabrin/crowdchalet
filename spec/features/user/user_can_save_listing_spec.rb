require 'rails_helper'

feature "User can save ski house listing" do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  
  scenario "user selects a listing to save to their account after doing a search" do
    VCR.use_cassette("#craigslist_search_ski_houses") do
      visit root_path
      
      click_link "Search Ski Houses"
      fill_in "max_price", with: "2000"
      fill_in "location",  with: "Frisco"
      click_button "Find"
      
      within("#listings div:nth-child(2)") do
        expect(page).to have_button("Save")
        click_button "Save"
      end
    end
  end
end
