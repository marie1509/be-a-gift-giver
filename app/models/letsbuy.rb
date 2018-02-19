class Letsbuy < ApplicationRecord
  include ActionView::Helpers
  validates :pay_amount, presence: true, numericality: { greater_than: 0 }

end
