class Item < ApplicationRecord
  mount_uploader :item_image, ImageUploader
  validates :item_name, presence: true
  validates :item_cost, numericality: { greater_than: -1 }

  validates :item_image, presence: true
  belongs_to :user
  has_many :willbuys, dependent: :destroy
  has_many :didbuys, dependent: :destroy
  has_many :letsbuys, dependent: :destroy


  # ユーザーがすでにwillbuyしているか確認するメソッド
    def willbuy_user(user_id)
      willbuys.find_by(user_id: user_id)
    end

  # ユーザーがすでにDidbuyしているか確認するメソッド
    def didbuy_user(user_id)
      didbuys.find_by(user_id: user_id)
    end
end
