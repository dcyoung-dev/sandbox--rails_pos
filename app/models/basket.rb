class Basket < ApplicationRecord
  has_many :basket_items
  has_one :order
  monetize :total_pence

  def self.incomplete
    where.missing(:order)
  end

  def total_pence
    basket_items.sum(&:total_pence)
  end
end
