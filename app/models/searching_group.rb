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
  
  def create_user_group(current_user_id)
    users_groups.create(user_id: current_user_id)
  end
  
  def listing_added?(listing_id)
    if group_listings.where(user_listing_id: listing_id).empty?
      false
    else
      true
    end 
  end
  
  def number_of_people_missing
    max_number_of_people - users.count 
  end
end