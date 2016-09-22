class LikesController < ApplicationController
  def create
    @ranking = UserRanking.find(params[:listing])
    @ranking.update(liked: true)
    render json: @ranking
  end
  
  def destroy
    @ranking = UserRanking.find(params[:listing])
    @ranking.update(liked: false)
    render json: @ranking
  end
  
  private
  
    def set_like
      Like.find_by(group_listing_id: (params[:listing]), user_id: current_user.id)
    end
end