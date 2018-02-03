class Willbuy < ApplicationRecord
  belongs_to :item, counter_cache: :willbuy_count
  belongs_to :user
end
