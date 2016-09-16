class AddGroupLeaderToSearchingGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :searching_groups, :group_leader, :integer
  end
end
