require 'rails_helper'

describe GroupListing, GroupListing: :model do
  it { should belong_to :searching_group }
  it { should belong_to :user_listing }
end