class Letsbuy < ApplicationRecord
  include ActionView::Helpers
  validates :pay_amount, presence: true
  
end
