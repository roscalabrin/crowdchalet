require 'rails_helper'

feature "User can create a searching group" do
  before do
    setup_for_omniauth
  end
  scenario "a group is created with all the required information" do
  visit root_path
  click_link "Login with Facebook"
  click_link "Create a Group"
  fill_in 'Name',                 with: "Winter 2016"
  fill_in 'Description',          with: "We love to ski."
  fill_in 'Location',             with: "Vail"
  fill_in 'Max number of people', with: 6
  fill_in 'Max budget per month', with: 400
  click_button "Create Group"
  
  group = SearchingGroup.last
  
  expect(current_path).to eq(searching_group_path(group))
  expect(page).to have_content "Winter 2016"
  expect(page).to have_content "We love to ski."
  expect(page).to have_content "Vail"
  end
end