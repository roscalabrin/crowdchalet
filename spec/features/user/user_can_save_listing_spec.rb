# require 'rails_helper'
# 
# feature "User can save ski house listing" do
#   scenario "user selects a listing to save to their account after doing a search" do
#     VCR.use_cassette("#craigslist_search_ski_houses") do
#       visit root_path
#       
#       click_link "Search Ski Houses"
#       fill_in "max_price", with: "2000"
#       fill_in "location",  with: "Frisco"
#       click_button "Find"
#       
#       # within(".search-results") do
#       #   click_button "Save"
#       #   #expect user listings to change by 1
#       #   #expect that button to say "Unsave"
#       # end
#   end
# end
