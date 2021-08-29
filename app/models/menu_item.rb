class MenuItem < ApplicationRecord
  belongs_to :product
  belongs_to :category

  scope :ordered, -> {order(position: :asc)}

  delegate :name, :price, to: :product
end
