class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def calculate_subtotal(carted_products)
    new_subtotal = 0
    carted_products.each do |carted_product|
      new_subtotal += (carted_product.product.price * carted_product.quantity)
    end
    self.subtotal = new_subtotal
  end

  def calculate_tax
    self.tax = subtotal * 0.09
  end

  def calculate_total
    self.total = subtotal + tax
  end

  def absolute_total(carted_products)
    calculate_subtotal(carted_products)
    calculate_tax
    calculate_total
  end
end
