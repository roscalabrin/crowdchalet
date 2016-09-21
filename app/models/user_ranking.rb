class UserRanking < ApplicationRecord
  belongs_to :user
  belongs_to :group_listing
  has_many :user_rankings, through: :group_listings
end