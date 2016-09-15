class User < ApplicationRecord
  validates :name, :email, :image, presence: true
  
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
