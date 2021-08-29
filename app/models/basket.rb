class Basket < ApplicationRecord
  has_many :basket_items
  monetize :total_pence

  def total_pence
    basket_items.sum(&:total_pence)
  end
end
