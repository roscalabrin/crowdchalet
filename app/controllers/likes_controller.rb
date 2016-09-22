class LikesController < ApplicationController
  def create
    ranking = UserRanking.find(params[:listing])
    ranking.update(liked: true)
    render json: ranking
  end
  
  def destroy
    ranking = UserRanking.find(params[:listing])
    ranking.update(liked: false)
    render json: ranking
  end
end