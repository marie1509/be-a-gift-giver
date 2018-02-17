class Didbuy < ApplicationRecord
  belongs_to :item, counter_cache: :didbuy_count
  belongs_to :user
end
