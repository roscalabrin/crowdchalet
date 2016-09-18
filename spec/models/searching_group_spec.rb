require 'rails_helper'

describe SearchingGroup, SearchingGroup: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :location }
  it { should validate_presence_of :max_number_of_people }
  it { should validate_presence_of :max_budget_per_month }
  it { should validate_presence_of :group_leader } 
  it { should have_many(:users).through(:users_groups) }
end