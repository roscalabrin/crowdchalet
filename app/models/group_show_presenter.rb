class GroupShowPresenter
  attr_reader :searching_group, :member
  
  def initialize(group_id, user_id)
    @group_id = group_id
    @user_id = user_id
  end
  
  def searching_group
    SearchingGroup.find(@group_id)
  end
  
  def member
    UsersGroup.where(user_id: @user_id, searching_group_id: @group_id)
  end
end