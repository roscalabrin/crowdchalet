class UserListingsController < ApplicationController 
  def create
    @user_listing = UserListing.find_or_create_by(
                      name: set_listing.first, 
                      url:  set_listing.second, 
                      user_id: current_user.id
                    )
    @user_listing.update(saved: true)
    render json: @user_listing
  end

  def destroy
    @user_listing = find_listing
    @user_listing.update(saved: false)
    render json: @user_listing
  end
  
  private
    
    def find_listing
      UserListing.find_by(name: set_listing.first, user_id: current_user.id)
    end
  
    def set_listing
      params[:listing].split("|")
    end
end