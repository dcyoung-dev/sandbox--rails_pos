class BasketItem < ApplicationRecord
  belongs_to :basket
  belongs_to :product

  monetize :total_pence

  delegate :price, :price_pence, :name, :stock_available?, to: :product

  validate :stock_availability

  after_commit :broadcast_product_update

  def increase_quantity
    self.quantity += 1
    save
  end

  def decrease_quantity
    self.quantity -= 1
    if quantity.positive?
      # TODO: This feels wrong
      save(validate: false)
    else
      destroy
    end
  end

  def total_pence
    price_pence * quantity
  end

  private

  def stock_availability
    errors.add(:product, :unavailable) unless stock_available?
  end

  def broadcast_product_update
    Turbo::StreamsChannel.broadcast_replace_later_to product,
      target: nil,
      targets: "[data-product-id='#{product_id}']",
      partial: "products/product", locals: {product: product}
  end
end
