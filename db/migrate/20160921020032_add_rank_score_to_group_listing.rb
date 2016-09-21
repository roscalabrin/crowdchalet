class AddRankScoreToGroupListing < ActiveRecord::Migration[5.0]
  def change
    add_column :group_listings, :rank_score, :integer, default: 0
  end
end
