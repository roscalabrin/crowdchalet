require 'rails_helper'

describe "User can see individual page for a searching group" do
  before do
    setup_for_omniauth
    visit root_path
    click_link "Login with Facebook"
  end
  
  scenario "User clicks on a group from the group index page and sees all the detailed info of a group they are not a member of" do
    group = create(:searching_group)
    
    click_link "JOIN A GROUP"
    click_link "Denver Couples: Winter 2016"

    expect(current_path).to eq(searching_group_path(group))
    expect(page).to have_content "Denver Couples: Winter 2016"
    expect(page).to have_content "Vail"
    expect(page).to have_content "12"
    expect(page).to have_content "Max number of people"
    expect(page).to have_content "12"
    expect(page).to have_content "Missing"
    expect(page).to have_content "Request to Join"
  end
    
  scenario "User clicks on a group from the group index page and sees all the detailed info of a group they are a member of" do
    user = User.find_by(name: "Roberta Doyle")
    group2 = create(:searching_group, name: "Weekend Warriors", group_leader: user.id)
    create(:users_group, user_id: user.id, searching_group_id: group2.id)

    click_link "JOIN A GROUP"
    click_link "Weekend Warriors"
    
    expect(current_path).to eq(searching_group_path(group2))
    expect(page).to have_content "Weekend Warriors"
    expect(page).to have_content "Vail"
    expect(page).to have_content "12"
    expect(page).to have_content "Max number of people"
    expect(page).to have_content "11"
    expect(page).to have_content "Missing"

    expect(page).to_not have_content "Request to Join"
  end
end