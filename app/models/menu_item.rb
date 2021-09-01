# frozen_string_literal: true

class MenuItem < ApplicationRecord
  belongs_to :product
  belongs_to :category

  scope :ordered, -> { order(position: :asc) }

  delegate :name, :price, :price_pence, :quantity_available, to: :product
end
