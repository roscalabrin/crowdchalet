class User < ApplicationRecord
  validates :name, :email, :image, presence: true
  has_many  :user_listings
  has_many  :users_groups
  has_many  :searching_groups, through: :users_groups
  has_many  :likes
  
  def self.from_omniauth(auth)
    where(uid: auth[:uid]).first_or_create do |user|
      user.uid         = auth.uid
      user.name        = auth.info.name
      user.email       = auth.info.email
      user.image       = auth.info.image
      user.oauth_token = auth.credentials.token
    end
  end
  
  def saved_listings
    user_listings.where(saved: true)
  end
  
  def unsaved_listing?(listing_url)
    # user_listings.find_by(url: listing.link).nil?
    if user_listings.find_by(url: listing_url) == nil 
      true
    elsif user_listings.find_by(url: listing_url, saved: false).nil? == false
      true
    else
      false
    end
  end
end
