require 'rails_helper'

feature "User logs in with Facebook" do
  before do
    setup_for_omniauth
  end
  scenario "user enters their Facebook credentials and logs in to the app" do
    visit root_path
    
    expect(page).to have_link "Login with Facebook"
    
    within(".navigation-menu") do
      click_link("Login with Facebook")
    end

    expect(page).to have_content "Hi, Roberta Doyle!"
    expect(page).to have_link "Logout"
    expect(page).not_to have_link "Login"
  end
  
  scenario "user logs out" do
    visit root_path
    
    expect(page).to have_link "Login with Facebook"
    
    within(".navigation-menu") do
      click_link "Login with Facebook"
    end
    
    within(".navigation-menu li:nth(2)") do
      click_link "Logout"
    end

    expect(current_path).to eq (root_path)
    expect(page).not_to have_link "Logout"
    expect(page).to have_link "Login with Facebook"
  end
end
