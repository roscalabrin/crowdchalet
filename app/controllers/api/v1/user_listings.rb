class Api::V1::UserListings < ApplicationController 
  def create
    require "pry"
    binding.pry
    @user_listing = UserListing.create(params[:listing_name])
   render json: @user_listing
  end
  
  def destroy
  end
end