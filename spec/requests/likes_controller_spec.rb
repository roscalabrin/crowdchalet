require 'rails_helper'

RSpec.describe LikesController, type: :request do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  
  describe "POST #create" do
    xit "creates a like associated to a specific user and a group listing " do
      user          = User.last
      group         = create(:searching_group, group_leader: user.id)
      listing       = create(:user_listing)
      group_listing = create(:group_listing, user_listing_id: listing.id, searching_group_id: group.id)
      
      post "/likes", {:listing => "#{group_listing.id}"}

      expect(response).to be_success

      content = JSON.parse(response.body)
    
      expect(content["group_listing_id"]).to eq(group_listing.id)
      expect(content["user_id"]).to eq(user.id)
    end
  end
    
  describe "DELETE #destroy" do
    xit "deletes a like associated to a specific user and a group listing " do
      user          = User.last
      group         = create(:searching_group, group_leader: user.id)
      listing       = create(:user_listing)
      group_listing = create(:group_listing, user_listing_id: listing.id, searching_group_id: group.id)
      
      delete "/likes", {:listing => "#{group_listing.id}"}

      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content).to eq nil
    end
  end
end
