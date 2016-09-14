require 'rails_helper'

RSpec.feature "User logs in with Facebook" do
  before do
    setup_for_omniauth
  end
  scenario "user enters their Facebook credentials and logs in to the app" do
    visit root_path
    
    expect(page).to have_link "Login with Facebook"
    
    click_link "Login with Facebook"
    
    expect(page).to have_content "Welcome, Roberta!"
    expect(page).to have_link "Logout"
    expect(page).not_to have_link "Login"
  end
end