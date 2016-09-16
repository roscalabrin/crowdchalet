require 'rails_helper'

feature "User sees all searching groups" do
  before do
    setup_for_omniauth
  end
  scenario "user visits the page with all the exisint searching groups" do
    visit root_path
    click_link "Login with Facebook"
    click_link "Join a Group"
    expect(current_path).to eq searching_groups_path
    # within("#groups-list") do
    #   # expect(page).to have_content "Winter in Vail 2016"
    #   # expect(page).to have_content "John M."
    #   # expect(page).to have_content "Denver couples in Frisco"
    #   # expect(page).to have_content "Mary Smith"
    # end
  end
end