class Decision < ApplicationRecord
  validates :by_user, presence: true
  validates :on_user, presence: true
end
