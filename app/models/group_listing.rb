class GroupListing < ApplicationRecord
  belongs_to :searching_group
  belongs_to :user_listing
  has_many   :user_rankings
  has_many   :likes
  
  def self.rank
    all.each do |group_listing|
      score = group_listing.user_rankings.average(:location) +
              group_listing.user_rankings.average(:price) +
              group_listing.user_rankings.where(liked: true).count
      group_listing.update(rank_score: score.to_i)
    end
    all.order(rank_score: :desc)
  end
end