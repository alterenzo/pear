class Decision < ApplicationRecord
  validates :by_user, presence: true
  validates :on_user, presence: true
  
  belongs_to :user, foreign_key: :by_user
end
