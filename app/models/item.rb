class Item < ApplicationRecord
  mount_uploader :item_image, ImageUploader
  validates :item_name, presence: true
  validates :item_image, presence: true
  belongs_to :user
  has_many :willbuys, dependent: :destroy

  # ユーザーがすでにwillbuyしているか確認するメソッド
    def willbuy_user(user_id)
      Willbuy.find_by(user_id: user_id)
    end
end
