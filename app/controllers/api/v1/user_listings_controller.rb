class Api::V1::UserListingsController < ApplicationController 
  def create
    listing_name = params[:listing].split("|").first
    listing_url = params[:listing].split("|").second
    UserListing.find_or_create_by(name: listing_name, url: listing_url, user_id: current_user.id)
  end

  def destroy
    listing_name = params[:listing].split("|").first
    listing = UserListing.find_by(name: listing_name, user_id: current_user.id)
    listing.delete
  end
end