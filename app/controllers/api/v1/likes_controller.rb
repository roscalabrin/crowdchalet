class Api::V1::LikesController < ApplicationController
  def create
    @like = Like.find_or_create_by(group_listing_id: (params[:listing]), user_id: current_user.id)
    # @like.update(unliked: false)
    # 
    # render json: @like
  end
  
  def destroy
    @like = Like.find_by(group_listing_id: (params[:listing]), user_id: current_user.id)
    @like.delete

    # render json: @like
  end
end