class User < ApplicationRecord
  validates :name, :email, :image, presence: true
  has_many :user_listings
  # has_many :searching_groups
  
  def self.from_omniauth(auth)
    where(uid: auth[:uid]).first_or_create do |user|
      user.uid         = auth.uid
      user.name        = auth.info.name
      user.email       = auth.info.email
      user.image       = auth.info.image
      user.oauth_token = auth.credentials.token
    end
  end
end
