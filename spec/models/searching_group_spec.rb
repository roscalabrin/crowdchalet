require 'rails_helper'

describe SearchingGroup, SearchingGroup: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :location }
  it { should validate_presence_of :max_number_of_people }
  it { should validate_presence_of :max_budget_per_month }
  it { should validate_presence_of :group_leader } 
  it { should have_many :users_groups }
  it { should have_many(:users).through(:users_groups) }
  it { should have_many :group_listings }
  
  it "creates an instance of users group when a leader creates a searching group" do
    user  = create(:user)
    group = create(:searching_group, group_leader: user.id)

    expect(UsersGroup.count).to eq(0)
    
    group.create_user_group(user.id)
    
    expect(UsersGroup.count).to eq(1)
  end
  
  it "returns false if the searching group does not have a specif listing" do
    group        = create(:searching_group)
    user_listing1 = create(:user_listing)
    user_listing2 = create(:user_listing)
    create(:group_listing, searching_group_id: group.id, user_listing_id: user_listing1.id)
    
    result = group.listing_added?(user_listing2.id)
    
    expect(result).to eq false
  end
  
  it "returns true if the searching group does have a specif listing" do
    group        = create(:searching_group)
    user_listing = create(:user_listing)
    create(:group_listing, searching_group_id: group.id, user_listing_id: user_listing.id)
    
    result = group.listing_added?(user_listing.id)
    
    expect(result).to eq true
  end
  
  it "returns the number of people missing in a group" do
    user  = create(:user)
    group = create(:searching_group, max_number_of_people: 12, group_leader: user.id)
    create(:users_group, user_id: user.id, searching_group_id: group.id)
  
    expect(group.number_of_people_missing).to eq 11
  end
end