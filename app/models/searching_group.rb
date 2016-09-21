class SearchingGroup < ApplicationRecord
  validates :name, 
            :description, 
            :location,
            :max_number_of_people, 
            :max_budget_per_month, 
            :group_leader, presence: true
  has_many :users_groups
  has_many :users, through: :users_groups
  has_many :group_listings
  
  def self.create_associated_user_rankings(searching_group_id, group_listing_id)
    find(searching_group_id).users.each do |user|
      require "pry"
      binding.pry
      UserRanking.find_or_create_by(user_id: user.id, group_listing_id: group_listing_id)
    end
  end
  
  def listing_added?(listing_id)
    if group_listings.where(user_listing_id: listing_id).empty?
      false
    else
      true
    end 
  end
end