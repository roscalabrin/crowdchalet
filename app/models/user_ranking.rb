class UserRanking < ApplicationRecord
  belongs_to :user
  belongs_to :group_listing
  has_many :user_rankings, through: :group_listings
  
  def self.remove_associated(group_listing_id)
    where(group_listing_id: group_listing_id).each do |user_ranking|
      user_ranking.delete
    end
  end
  
  def location_rank
    return "Great" if location == 1
    return "OK"    if location == 0
    return "Meh"   if location == -1
  end

  def price_rank
    return "Great" if location == 1
    return "OK"    if location == 0
    return "Meh"   if location == -1
  end
end