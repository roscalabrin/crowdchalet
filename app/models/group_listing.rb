class GroupListing < ApplicationRecord
  belongs_to :searching_group
  belongs_to :user_listing
  has_many   :user_rankings
  
  def self.rank
    all.each do |group_listing|
      if group_listing.user_rankings.empty?
          group_listing.update(rank_score: 0)
      else
        score = group_listing.user_rankings.average(:location) +
                group_listing.user_rankings.average(:price) +
                group_listing.user_rankings.where(liked: true).count
        group_listing.update(rank_score: score.to_i)
      end
    end
    all.order(rank_score: :desc)
  end
end