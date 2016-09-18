class GroupListing < ApplicationRecord
  belongs_to :searching_group
  belongs_to :user_listing
  has_many   :likes
end