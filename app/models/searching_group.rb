class SearchingGroup < ApplicationRecord
  validates :name, 
            :description, 
            :location,
            :max_number_of_people, 
            :max_budget_per_month, 
            :group_leader, presence: true
  has_many :users_groups
  has_many :users, through: :users_groups
end