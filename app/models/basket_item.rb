class BasketItem < ApplicationRecord
  belongs_to :basket
  belongs_to :product

  monetize :total_pence

  delegate :price, :price_pence, :name, to: :product

  def increase_quantity
    self.quantity += 1
    save
  end

  def decrease_quantity
    self.quantity -= 1
    if quantity.positive?
      save
    else
      destroy
    end
  end

  def total_pence
    price_pence * quantity
  end
end
