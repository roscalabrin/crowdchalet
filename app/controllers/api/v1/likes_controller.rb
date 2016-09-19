class Api::V1::LikesController < ApplicationController
  def create
    @like = Like.find_or_create_by(group_listing_id: (params[:listing]), user_id: current_user.id)
    render json: @like
  end
  
  def destroy
    like = set_like
    like.delete
    @like = set_like
    render json: @like
  end
  
  private
  
    def set_like
      Like.find_by(group_listing_id: (params[:listing]), user_id: current_user.id)
    end
end