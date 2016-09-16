class SearchingGroupsController < ApplicationController
  def index
    @searching_groups = SearchingGroup.all
  end
  
  def new
    @searching_group = SearchingGroup.new
  end
  
  def create
    @searching_group = SearchingGroup.new(group_params)
    @searching_group.update(group_leader: current_user.id)
    if @searching_group.save
      UsersGroup.create(user_id: current_user.id, searching_group_id: @searching_group.id)
      flash.now[:sucess] = "You have successfully created the #{@searching_group.name} group!"
      redirect_to @searching_group
    else
      flash[:failure] = @searching_group.errors.full_messages.join(', ')
      redirect_to new_searhing_group_path
    end
  end
  
  def show
    @searching_group = SearchingGroup.find(params[:id])
  end
  
  private
  
  def group_params
    params.require(:searching_group).permit(
      :name,
      :description,
      :location,
      :max_number_of_people,
      :max_budget_per_month
    )
  end
end