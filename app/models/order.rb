class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }
  def calculate_subtotal
    self.subtotal = product.price * quantity
  end

  def calculate_tax
    self.tax = subtotal * 0.09
  end

  def calculate_total
    self.total = subtotal + tax
  end

  def absolute_total
    calculate_subtotal
    calculate_tax
    calculate_total
  end
end
