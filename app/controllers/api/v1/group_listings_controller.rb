class Api::V1::GroupListingsController < ApplicationController
  def create
    listing_name = params[:listing].split("|").first
    listing_url = params[:listing].split("|").second
    group_id = params[:listing].split("|").third
    listing_id = UserListing.find_by(name: listing_name, url: listing_url, user_id: current_user.id).id
    GroupListing.find_or_create_by(user_listing_id: listing_id, searching_group_id: group_id)
    #update attribute to de display true
  end
  
  def destroy
  end
end