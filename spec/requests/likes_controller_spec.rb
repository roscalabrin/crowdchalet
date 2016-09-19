require 'rails_helper'

RSpec.describe Api::V1::LikesController, type: :request do
  
  describe "POST #create" do
    
    xit "creates a like associated to a specific user and a group listing " do
    #how to stub authenticathed user?
      group   = create(:searching_group, group_leader: user.id)
      listing = create(:user_listing)
      group_listing = create(:group_listing, user_listing_id: listing.id, searching_group_id: group.id)
      
      post "/api/v1/likes", {:listing => "#{listing.id}"}

      expect(response).to be_sucess

      content = JSON.parse(response.body)
      expect(content.count).to eq(1)
    end
  end
end
