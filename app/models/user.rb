class User < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :user_email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  validates :birth_date, presence: true

  validates :password, presence: true, length: { minimum: 6 }
  before_save { user_email.downcase! }
  has_secure_password
  has_one :icon
  has_many :items, dependent: :destroy
  has_many :willbuys, dependent: :destroy
end
