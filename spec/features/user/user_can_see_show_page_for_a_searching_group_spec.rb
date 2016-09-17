require 'rails_helper'

describe "User can see individual page for a searching group" do
  before do
    setup_for_omniauth
  end
  scenario "User clicks on a group from the group index page and sees all the detailed info of a group they are not a member of" do
    group = create(:searching_group)
    visit root_path
    click_link "Login with Facebook"
    click_link "Join a Group"
    click_link "Denver Couples: Winter 2016"
    
    expect(current_path).to eq(searching_group_path(group))
    expect(page).to have_content "Denver Couples: Winter 2016"
    expect(page).to have_content "Vail"
    expect(page).to have_content "12"
    expect(page).to have_content "Max number of people"
    expect(page).to have_content "4"
    expect(page).to have_content "Missing"
    expect(page).to have_button  "Request to Join"
  end
end