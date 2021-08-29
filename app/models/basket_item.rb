class BasketItem < ApplicationRecord
  belongs_to :basket
  belongs_to :product

  delegate :price, :price_pence, :name, to: :product
end
