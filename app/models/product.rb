class Product < ApplicationRecord
  has_many :menu_items
  has_many :basket_items

  monetize :price_pence

  def quantity_available
    quantity_in_stock - quantity_in_baskets
  end

  def quantity_in_stock
    stock_count
  end

  def quantity_in_baskets
    basket_items.sum(:quantity)
  end

  def stock_available?
    quantity_available.positive?
  end
end
