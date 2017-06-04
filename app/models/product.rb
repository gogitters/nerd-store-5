class Product < ActiveRecord::Base
  has_many :images
  belongs_to :supplier
  has_many :orders

  validates :name, :description, :price, presence: true
  validates :name, uniqueness: true
  
  def sale_message 
    if price <= 5
      "Discount Item!!!!!!"
    else
      "Everyday Value!!!!!!!!"
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def red_price
    "sale_price" if price <= 5
  end
end
