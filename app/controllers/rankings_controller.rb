class RankingsController < ApplicationController
 include RankingsHelper  
 
  def create
    if rank_attribute == "location"
      find_user_listing.update(location: choice_value)
    else
      find_user_listing.update(price: choice_value)
    end
    render json: @user_ranking
  end
  
  private
  
    def rank_attribute
      params[:rank].split("|").first
    end
    
    def rank_choice
      params[:rank].split("|").second
    end
    
    def find_user_listing
      user_ranking_id = params[:rank].split("|").third
      @user_ranking = UserRanking.find(user_ranking_id)    
    end
end