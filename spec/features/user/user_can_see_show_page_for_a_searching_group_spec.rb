require 'rails_helper'

describe "User can see individual page for a searching group" do
  before do
    setup_for_omniauth
  end
  scenario "User clicks on a group from the group index page and sees all the detailed info about that group" do
    group = create(:searching_group)
    visit root_path
    click_link "Login with Facebook"
    click_link "Join a Group"
    click_link "Denver Couples: Winter 2016"
    
    expect(current_path).to eq(searching_group_path(group))
    expect(page).to have_content "Vail"
    expect(page).to have_content ""
    
  end
end