require 'rails_helper'

feature "Group member can like a listing from the group" do
  before do
    setup_for_omniauth
    visit root_path
    click_link "Login with Facebook"
  end

  scenario "Group member visits their group show page and likes a listing from the group listings" do
    user = User.find_by(name: "Roberta Doyle")
    group = create(:searching_group, name: "Weekend Warriors", group_leader: user.id)
    create(:users_group, user_id: user.id, searching_group_id: group.id)

    visit searching_group_path(group)
    
    within(".group-table") do
      #expect page to have listing with the "like" button
      #user click on like button 
      #expect button to be "Liked"
    end
  end
end