class GroupListingsController < ApplicationController
  def create   
    listing_id = find_listing_id
    group_listing = find_group_listing(listing_id)
    SearchingGroup.create_associated_user_rankings(set_listing.third, group_listing.id)
    render json: true
  end
  
  def destroy
    listing_id = find_listing_id
    group_listing = find_group_listing(listing_id)
    UserRanking.remove_associated(group_listing.id)
    group_listing.delete
    render json: false
  end
  
  private
  
    def set_listing
      params[:listing].split("|")
    end
    
    def find_listing_id
      UserListing.find_by(name: set_listing.first, url: set_listing.second, user_id: current_user.id).id
    end
    
    def find_group_listing(listing_id)
      GroupListing.find_or_create_by(user_listing_id: listing_id, searching_group_id: set_listing.third)
    end
end