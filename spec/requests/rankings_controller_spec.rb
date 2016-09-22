require 'rails_helper'

RSpec.describe RankingsController, type: :request do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  
  describe "POST #create" do
    it "changes a user's location ranking for a group listing" do
      user          = User.last
      group_listing = create(:group_listing)
      user_ranking  = create(:user_ranking, group_listing_id: group_listing.id, user_id: user.id)
      create(:user_ranking, group_listing_id: group_listing.id, location: 0)
      
      expect(user_ranking.location_rank).to eq "Ok"
      post "/rankings", {:rank => "location|meh|#{user_ranking.id}"}

      expect(response).to be_success

      content = JSON.parse(response.body)
      
      expect(content["id"]).to eq (user_ranking.id)
      expect(content["location"]).to eq -1
      
      updated_user_ranking = UserRanking.find(user_ranking.id)
      expect(updated_user_ranking.location_rank).to eq "Meh"
    end
  end
end