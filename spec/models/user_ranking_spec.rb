require 'rails_helper'

describe UserRanking, UserRanking: :model do
  it { should belong_to :user }
  it { should belong_to :group_listing }
  
  it "returns a specif text for a specif location rank" do
    user_ranking = create(:user_ranking, location: 0)
    expect(user_ranking.location_rank).to eq "Ok"
    
    user_ranking = create(:user_ranking, location: 1)
    expect(user_ranking.location_rank).to eq "Great"
    
    user_ranking = create(:user_ranking, location: -1)
    expect(user_ranking.location_rank).to eq "Meh"
  end
  
  it "returns a specif text for a specif price rank" do
    user_ranking = create(:user_ranking, price: 0)
    expect(user_ranking.price_rank).to eq "Ok"
    
    user_ranking = create(:user_ranking, price: 1)
    expect(user_ranking.price_rank).to eq "Great"
    
    user_ranking = create(:user_ranking, price: -1)
    expect(user_ranking.price_rank).to eq "Meh"
  end
  
  it "removed all the associated user_ranking to a specific group listing" do
    group_listing = create(:group_listing)
    create(:user_ranking, group_listing_id: group_listing.id)
    create(:user_ranking, group_listing_id: group_listing.id)
    
    expect(UserRanking.count).to eq 2
    
    UserRanking.remove_associated(group_listing.id)
  
    expect(UserRanking.count).to eq 0
  end
end