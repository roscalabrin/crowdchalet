class UserListing < ApplicationRecord
  belongs_to :user
  has_many   :user_rankings
end