class Basket < ApplicationRecord
  has_many :basket_items

  def total
    basket_items.sum(&:price)
  end
end
