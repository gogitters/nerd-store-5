class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order, optional: true

  validates :quantity, presence: true
  validates :quantity, numericality: true
end
