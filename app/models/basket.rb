class Basket < ApplicationRecord
  has_many :basket_items
  monetize :total_pence
  def total_pence
    basket_items.sum(&:price_pence)
  end
end
