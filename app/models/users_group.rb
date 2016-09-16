class UsersGroup < ApplicationRecord
  belongs_to :user
  belongs_to :searching_group
end