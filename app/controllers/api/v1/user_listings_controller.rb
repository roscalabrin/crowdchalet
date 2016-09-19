class Api::V1::UserListingsController < ApplicationController 
  def create
    UserListing.find_or_create_by(
      name: set_listing.first, 
      url:  set_listing.second, 
      user_id: current_user.id
    )
  end

  def destroy
    listing = UserListing.find_by(name: lset_listing.first, user_id: current_user.id)
    listing.delete
  end
  
  private
  
    def set_listing
      params[:listing].split("|")
    end
end