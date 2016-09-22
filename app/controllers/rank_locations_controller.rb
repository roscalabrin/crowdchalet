class RankLocationsController < ApplicationController
  
  def create
    if rank_attribute == "location"
      find_user_listing.update(location: choice_value)
    else
      find_user_listing.update(price: choice_value)
    end
  end
  
  private
  
    def rank_attribute
      group_listing_id = params[:rank].split("|").first
    end
    
    def rank_choice
      group_listing_id = params[:rank].split("|").second
    end
    
    def choice_value
      return 1  if rank_choice == "great"
      return 0  if rank_choice == "ok"
      return -1 if rank_choice == "meh"
    end
    
    def find_user_listing
      group_listing_id = params[:rank].split("|").third
      UserRanking.find(group_listing_id)    
    end
end