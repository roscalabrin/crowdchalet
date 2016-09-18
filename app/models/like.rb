class Like < ApplicationRecord
  belongs_to :group_listing
  belongs_to :user
end