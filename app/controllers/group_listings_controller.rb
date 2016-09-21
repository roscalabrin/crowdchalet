class GroupListingsController < ApplicationController
  def create
    listing_name = params[:listing].split("|").first
    listing_url = params[:listing].split("|").second
    group_id = params[:listing].split("|").third
    
    listing_id = UserListing.find_by(name: listing_name, url: listing_url, user_id: current_user.id).id
    
    group_listing = GroupListing.find_or_create_by(user_listing_id: listing_id, searching_group_id: group_id)
    
    SearchingGroup.find(group_id).users.each do |user|
      UserRanking.find_or_create_by(user_id: user.id, group_listing_id: group_listing.id, location: 0, price: 0, liked: false)
    end
    #update attribute to de display true
  end
  
  def destroy
  end
end