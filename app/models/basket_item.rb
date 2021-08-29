class BasketItem < ApplicationRecord
  belongs_to :basket
  belongs_to :product

  delegate :price, :name, to: :product
end
