class User < ApplicationRecord
  acts_as_taggable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.photo = auth.info.image
      user.name = auth.info.name
      user.username = auth.info.nickname
    end
  end

end
