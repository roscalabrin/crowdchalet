class Api::V1::UserListingsController < ApplicationController 
  def create
    listing_name = params[:listing].split("|").first
    listing_url = params[:listing].split("|").second
    UserListing.first_or_create(name: listing_name, url: listing_url, user_id: current_user.id)
  end

  # def destroy
  # end
end