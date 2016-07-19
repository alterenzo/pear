class User < ApplicationRecord
  acts_as_taggable
  # before_save :split_tags
  # serialize :tags, Array

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github]

  # def split_tags
  #   self.tags = self.tags.split(',')
  #   p tags
  #   p self.tags
  # end

  def tags=(skills)
    self.tags = skills.split(",").map do |skill|
        Tag.where(name: skill).first_or_create!
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

end
