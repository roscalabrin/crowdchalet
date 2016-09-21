require 'rails_helper'

describe User, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :image }
  it { should have_many            :user_listings }
  
  it "returns a user saved listings" do
    user = create(:user)
    create(:user_listing, user_id: user.id, saved: true)
    create(:user_listing, user_id: user.id, saved: true)
    create(:user_listing, user_id: user.id, saved: false)
    
    expect(user.user_listings.count).to eq 3
    expect(user.saved_listings.count).to eq 2
  end
  
  it "checks if an user has a specif listing saved or not" do
    user        = create(:user)
    listing_url = "https://rockies.craigslist.org/apa/5774733580.html"
    response = user.unsaved_listing?(listing_url)
    
    expect(response).to eq true
    
    listing = create(:user_listing, user_id: user.id, url: listing_url, saved: true)
    result = user.unsaved_listing?(listing_url)
    expect(result).to eq false
    
    listing.update(saved: false)
    result = user.unsaved_listing?(listing_url)
    expect(result).to eq true
  end
  
  it "finds all user's rankings for a specific searching group" do
    user          = create(:user)
    listing       = create(:user_listing)
    group         = create(:searching_group, group_leader: user.id)
    # group_listing = create(:group_listing, user_listing: listing.id, searching_group: group.id)  
    # create(:user_ranking, user_id: user.id, group_listing_id: group_listing.id)
    # create(:user_ranking, user_id: user.id, group_listing_id: group_listing.id)
    # 
    # result = user.find_rankings(group.id)
    # expect(result.count).to eq 2
  end

end