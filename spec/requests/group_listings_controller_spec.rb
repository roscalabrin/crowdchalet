require 'rails_helper'

RSpec.describe GroupListingsController, type: :request do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  
  describe "POST #create" do
    it "creates a group listing" do
      user         = User.last
      user_listing = create(:user_listing, user_id: user.id, name: "House in Frisco", url: "www.house.com")
      group        = create(:searching_group, group_leader: user.id)
      create(:users_group, user_id: user.id, searching_group_id: group.id)
      
      expect(GroupListing.count).to eq 0
      
      post "/group_listings", {:listing => "House in Frisco|www.house.com|#{group.id}"}

      expect(response).to be_success
      expect(response.body).to eq "true"
      expect(GroupListing.count).to eq 1
    end
  end
    
  describe "DELETE #destroy" do
    it "deletes a group listing" do
      user         = User.last
      user_listing = create(:user_listing, user_id: user.id, name: "House in Frisco", url: "www.house.com")
      group        = create(:searching_group)
      create(:users_group, user_id: user.id, searching_group_id: group.id)
      group_listing = create(:group_listing, user_listing_id: user_listing.id, searching_group_id: group.id)
      
      expect(GroupListing.count).to eq 1
      
      delete "/group_listings", {:listing => "House in Frisco|www.house.com|#{group.id}"}

      expect(response).to be_success

      expect(response.body).to eq "false"
      expect(GroupListing.count).to eq 0
    end
  end
end