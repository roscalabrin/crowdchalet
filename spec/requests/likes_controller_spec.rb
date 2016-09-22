require 'rails_helper'

RSpec.describe LikesController, type: :request do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  
  describe "POST #create" do
    it "updates the liked attribute of a group listing to be true" do
      user          = User.last
      group_listing = create(:group_listing)
      user_ranking = create(:user_ranking, user_id: user.id, group_listing_id: group_listing.id, liked: false)
      
      post "/likes", {:listing => "#{user_ranking.id}"}

      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content["id"]).to eq(user_ranking.id)
      expect(content["liked"]).to eq true
    end
  end
    
  describe "DELETE #destroy" do
    it "updates the liked attribute of a group listing to be true" do
      user          = User.last
      group_listing = create(:group_listing)
      user_ranking = create(:user_ranking, user_id: user.id, group_listing_id: group_listing.id, liked: true)
      
      delete "/likes", {:listing => "#{user_ranking.id}"}

      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content["id"]).to eq(user_ranking.id)
      expect(content["liked"]).to eq false
    end
  end
end
