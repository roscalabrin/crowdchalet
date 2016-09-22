require 'rails_helper'

RSpec.describe UserListingsController, type: :request do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  
  describe "POST #create" do
    it "saves a house listing to the user account" do
      user          = User.last
      expect(UserListing.count).to eq 0
      
      post "/user_listings", {:listing => "House in Breck|www.house.com"}

      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content["name"]).to eq "House in Breck"
      expect(content["url"]).to eq "www.house.com"
      expect(content["saved"]).to eq true
      expect(UserListing.count).to eq 1
    end
  end
    
  describe "DELETE #destroy" do
    it "updates the attribute of a house listing associated with an user to not be saved" do
      user          = User.last
      user_listing  = create(:user_listing, user_id: user.id, saved: true)
      expect(UserListing.count).to eq 1
      
      delete "/user_listings", {:listing => "#{user_listing.name}|#{user_listing.url}"}

      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content["id"]).to eq(user_listing.id)
      expect(content["name"]).to eq(user_listing.name)
      expect(content["url"]).to eq(user_listing.url)
      expect(content["saved"]).to eq false
      expect(UserListing.count).to eq 1
    end
  end
end
