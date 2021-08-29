class Product < ApplicationRecord
  has_many :menu_items

  monetize :price_pence
end
