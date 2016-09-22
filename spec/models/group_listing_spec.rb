require 'rails_helper'

describe GroupListing, GroupListing: :model do
  it { should belong_to :searching_group }
  it { should belong_to :user_listing }
  it { should have_many :user_rankings }

  
  it "ranks the group listings based on location, price and like count" do 
    user = create(:user)
    user_listing = create(:user_listing, user_id: user.id)
    group_listing1 = create(:group_listing)
    create(:user_ranking, group_listing_id: group_listing1.id)
    
    group_listing2 = create(:group_listing, rank_score: 1)
    create(:user_ranking, group_listing_id: group_listing2.id, location: 1, liked: true)
    
    group_listing3 = create(:group_listing, rank_score: 3)
    create(:user_ranking, group_listing_id: group_listing3.id, price: 1)

    ranked_group_listings = GroupListing.rank
  
    expect(ranked_group_listings.first).to eq group_listing2
    expect(ranked_group_listings.second).to eq group_listing3
    expect(ranked_group_listings.third).to eq group_listing1
  end
  
  it "creates default user rankings for group members" do
    user          = create(:user)
    group         = create(:searching_group, group_leader: user.id)
    create(:users_group, user_id: user.id, searching_group_id: group.id)
    group_listing = create(:group_listing, searching_group_id: group.id)
  
    expect(UserRanking.count).to eq(0)

    group_listing.create_initial_user_rankings
    
    expect(UserRanking.count).to eq(1)
  end
  
end