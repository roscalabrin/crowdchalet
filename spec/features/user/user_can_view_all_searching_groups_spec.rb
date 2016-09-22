require 'rails_helper'

feature "User sees all searching groups" do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  scenario "user visits the page with all the exisint searching groups" do
    visit root_path
  
    click_link "JOIN A GROUP" 
    expect(current_path).to eq searching_groups_path
  end
end