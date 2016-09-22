require 'rails_helper'

feature "User can create a searching group" do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  scenario "user can see their account dashbaord" do
    visit root_path
    
    within(".navigation-menu") do
      click_link "My Account"
    end
    
    user = User.last
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content "Profile Information"
    expect(page).to have_content "Groups"
    expect(page).to have_content "Saved Listings"
    expect(page).to have_content "Notifications"
  end
end