require 'rails_helper'

describe User, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :image }
  it { should have_many            :user_listings }
end