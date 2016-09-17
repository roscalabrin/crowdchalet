require 'rails_helper'

describe "User can see individual page for a searching group" do
  before do
    setup_for_omniauth
    visit root_path
    click_link "Login with Facebook"
  end
  
  scenario "User clicks on a group from the group index page and sees all the detailed info of a group they are not a member of" do
    group = create(:searching_group)
    
    click_link "Join a Group"
    click_link "Denver Couples: Winter 2016"
  
    expect(current_path).to eq(searching_group_path(group))
    expect(page).to have_content "Denver Couples: Winter 2016"
    expect(page).to have_content "Vail"
    expect(page).to have_content "12"
    expect(page).to have_content "Max number of people"
    expect(page).to have_content "4"
    expect(page).to have_content "Missing"
    expect(page).to have_button "Request to Join"
  end
    
  scenario "User clicks on a group from the group index page and sees all the detailed info of a group they are a member of" do
    #change test to be create user and then see the show page
    user = User.first
    group2 = create(:searching_group, name: "Weekend Warriors", group_leader: user.id)
    create(:users_group)

    click_link "Join a Group"
    click_link "Weekend Warriors"
    
    expect(current_path).to eq(searching_group_path(group2))
    expect(page).to have_content "Weekend Warriors"
    expect(page).to have_content "Vail"
    expect(page).to have_content "12"
    expect(page).to have_content "Max number of people"
    expect(page).to have_content "4"
    expect(page).to have_content "Missing"
save_and_open_page
    expect(page).to_not have_button "Request to Join"
    
    # within(".group-member-view") do
    #   expect(page).to have_content "Me Saved Listings"
    #   expect(page).to have_content "Group Listings"
    # end
  end
end