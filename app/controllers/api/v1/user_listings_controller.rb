class Api::V1::UserListingsController < ApplicationController 
  def create
    listing_name = params[:listing].split("|").first
    listing_url = params[:listing].split("|").second
    UserListing.create(name: listing_name, url: listing_url, user_id: current_user.id)
    require "pry"
    binding.pry
  #  render json: @user_listing
  end

  # def destroy
  # end
end