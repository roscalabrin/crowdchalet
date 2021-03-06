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
      @searching_group.create_user_group(current_user.id)
      redirect_to @searching_group
    else
      failure
    end
  end
  
  def show
    current_user_id = current_user ? current_user.id : 0
    @presenter = GroupShowPresenter.new(params[:id], current_user_id)
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
  
  def failure
    flash[:failure] = @searching_group.errors.full_messages.join(', ')
    redirect_to new_searching_group_path
  end
end