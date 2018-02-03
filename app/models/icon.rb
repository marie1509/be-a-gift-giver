class Icon < ApplicationRecord
  validates :icon, presence: true
  has_one :user
  mount_uploader :icon, ImageUploader
end
