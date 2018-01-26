class Item < ApplicationRecord
  mount_uploader :item_image, ImageUploader
  validates :item_name, presence: true
  # validates :item_image, presence: true
end
